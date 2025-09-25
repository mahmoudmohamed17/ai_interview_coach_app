import 'dart:developer';
import 'package:ai_interview_coach_app/views/home_view/home_view.dart';
import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/backend/models/interview_difficulty_level_model.dart';
import 'package:ai_interview_coach_app/backend/models/interview_topic_model.dart';
import 'package:ai_interview_coach_app/views/recent_session_details_view/recent_session_details_view.dart';
import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_auth_service.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_database_service.dart';
import 'package:ai_interview_coach_app/core/utilities/build_performance_models.dart';
import 'package:ai_interview_coach_app/core/utilities/build_suggestions_models.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentSessionsCubit extends Cubit<RecentSessionsState> {
  RecentSessionsCubit(this.supabaseDatabaseService, this.supabaseAuthService)
    : super(const PracticeSessionsInitial()) {
    fetchSessions();
  }

  final SupabaseDatabaseService supabaseDatabaseService;
  final SupabaseAuthService supabaseAuthService;

  List<QuizSessionModel> _sessions = [];

  // Used to store the current topic, level selected and also feedback for further operations,
  // mean that those will be used at addQuizSession(), then will return to null after that
  InterviewTopicModel? _currentTopic;
  InterviewDifficultyLevelModel? _currentLevel;
  FeedbackModel? _currentFeedback;
  int? _answeredQuestions;
  String? _timeSpent;

  // Helps to store data at [performance_breakdown] and [suggestions] tables for a specific quiz session;
  String? _currentQuizId;

  set currentTopic(InterviewTopicModel model) => _currentTopic = model;
  InterviewTopicModel? get getCurrentTopic => _currentTopic;

  set currentLevel(InterviewDifficultyLevelModel model) =>
      _currentLevel = model;
  InterviewDifficultyLevelModel? get gerCurrentLevel => _currentLevel;

  set currentFeedback(FeedbackModel model) => _currentFeedback = model;
  FeedbackModel? get getCurrentFeedback => _currentFeedback;

  set answeredQuestions(int value) => _answeredQuestions = value;
  int? get getAnsweredQuestions => _answeredQuestions;

  set timeSpent(String value) => _timeSpent = value;
  String? get getTimeSpent => _timeSpent;

  set currentQuizId(String value) => _currentQuizId = value;
  String? get getCurrentQuizId => _currentQuizId;

  /// Call this when the app starts; to fetch the latest sessions data
  Future<void> fetchSessions() async {
    emit(const PracticeSessionsLoading());
    try {
      _sessions = await supabaseDatabaseService.getQuizSessions(
        supabaseAuthService.currentUser!.id,
      );
      emit(
        _sessions.isEmpty
            ? const PracticeSessionsInitial()
            : PracticeSessionsFilled(currentSessions: _sessions),
      );
    } catch (e) {
      emit(PracticeSessionsError(message: e.toString()));
    }
  }

  /// Adding a quiz session to the database and return it using the local models
  Future<void> addQuizSession() async {
    // To prevent show the loading indicator when adding new item; as this's unnecessary
    emit(PracticeSessionsRefreshing(_sessions));
    try {
      final model = QuizSessionModel(
        userId: supabaseAuthService.currentUser?.id,
        topic: _currentTopic?.topic,
        totalQuestions: _currentLevel?.questionsNumber,
        answeredQuestions: _answeredQuestions,
        correctAnswers: _currentFeedback?.correctAnswers,
        wrongAnswers: _currentFeedback?.wrongAnswers,
        score: _currentFeedback?.score,
        overview: _currentFeedback?.overview,
        difficulty: _currentLevel?.level,
        createdAt: DateTime.now(),
        timeSpent: _timeSpent,
      );
      final result = await supabaseDatabaseService.addQuizSession(model);
      currentQuizId = result.id!; // To use it in other operations
      _sessions.add(result);
      emit(PracticeSessionsFilled(currentSessions: _sessions));
    } catch (e) {
      log('Error in adding quiz: ${e.toString()}');
      emit(PracticeSessionsError(message: e.toString()));
    }
  }

  /// Adding performance breakdown items and suggestions related to the current quiz session
  Future<void> addQuizSessionRelatedData() async {
    emit(PracticeSessionsRefreshing(_sessions));
    try {
      final performanceModels = buildPerformanceModels(
        technicalKnowledge: _currentFeedback!.technicalKnowledge,
        problemSolving: _currentFeedback!.problemSolving,
        bestPractices: _currentFeedback!.bestPractices,
        quizId: _currentQuizId!,
        userId: supabaseAuthService.currentUser!.id,
      );
      final suggestions = buildSuggestionsModels(
        list: _currentFeedback!.suggestionsForImprovement,
        quizId: _currentQuizId!,
        userId: supabaseAuthService.currentUser!.id,
      );
      await supabaseDatabaseService.addPerformanceItems(performanceModels);
      await supabaseDatabaseService.addQuizSuggestions(suggestions);
      emit(PracticeSessionsFilled(currentSessions: _sessions));
    } catch (e) {
      emit(PracticeSessionError(message: e.toString()));
    }
  }

  /// Only used for indicates whether to go home or start a new quiz
  void createNewInterview() => emit(const PracticeSessionsNavigating());

  /// To get the data related to a specific quiz session.
  /// This called when navigating to [RecentSessionDetailsView]
  Future<void> getPracticeSessionData(String quizId) async {
    emit(PracticeSessionLoading());
    try {
      final performanceModel = await supabaseDatabaseService
          .getPerformanceItems(quizId);
      final suggestions = await supabaseDatabaseService.getQuizSuggestions(
        quizId,
      );
      emit(
        PracticeSessionLoaded(
          performanceModel: performanceModel,
          suggestions: suggestions,
        ),
      );
    } catch (e) {
      emit(PracticeSessionError(message: e.toString()));
    }
  }

  /// Deleting a quiz session with it's related data and update the sessions list at [HomeView]
  Future<void> deleteQuizSession(String quizId) async {
    emit(PracticeSessionsRefreshing(_sessions));
    try {
      final items = await supabaseDatabaseService.deleteQuizSession(
        quizId,
        supabaseAuthService.currentUser!.id,
      );
      await supabaseDatabaseService.deleteQuizPerformanceItems(quizId);
      await supabaseDatabaseService.deleteQuizSuggestions(quizId);
      _sessions = items;
      emit(
        _sessions.isEmpty
            ? const PracticeSessionsInitial()
            : PracticeSessionsFilled(currentSessions: items),
      );
    } catch (e) {
      emit(PracticeSessionError(message: e.toString()));
    }
  }

  /// Deleting all quiz sessions with it's related data for the current user
  Future<void> deleteAllUserSessions() async {
    emit(PracticeSessionsRefreshing(_sessions));
    try {
      await supabaseDatabaseService.deleteUserSessions(
        supabaseAuthService.currentUser!.id,
      );
      await supabaseDatabaseService.deleteUserPerformanceItems(
        supabaseAuthService.currentUser!.id,
      );
      await supabaseDatabaseService.deleteUserSessions(
        supabaseAuthService.currentUser!.id,
      );
      _sessions = [];
      emit(const PracticeSessionsInitial());
    } catch (e) {
      emit(PracticeSessionError(message: e.toString()));
    }
  }
}
