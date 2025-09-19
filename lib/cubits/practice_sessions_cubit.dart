import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_auth_service.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_database_service.dart';
import 'package:ai_interview_coach_app/cubits/practice_sessions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeSessionsCubit extends Cubit<PracticeSessionsState> {
  PracticeSessionsCubit(this.supabaseDatabaseService, this.supabaseAuthService)
    : super(const PracticeSessionsInitial()) {
    fetchSessions();
  }

  final SupabaseDatabaseService supabaseDatabaseService;
  final SupabaseAuthService supabaseAuthService;

  List<QuizSessionModel> _sessions = [];

  /// Call this when the app starts; to fetch the latest data
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

  /// Adding a quiz session to the database and return it
  Future<void> addQuizSession({
    String? topic,
    int? totalQuestions,
    int? answeredQuestions,
    double? score,
    String? overview,
    String? difficulty,
    String? timeSpent,
  }) async {
    // To prevent show the loading indicator when adding new item; as this's unnecessary
    emit(PracticeSessionsRefreshing(_sessions));
    try {
      final model = QuizSessionModel(
        userId: supabaseAuthService.currentUser!.id,
        topic: topic,
        totalQuestions: totalQuestions,
        answeredQuestions: answeredQuestions,
        score: score,
        overview: overview,
        difficulty: difficulty,
        createdAt: DateTime.now(),
        timeSpent: timeSpent,
      );
      final result = await supabaseDatabaseService.addQuizSession(model);
      _sessions.add(result);
      emit(PracticeSessionsFilled(currentSessions: _sessions));
    } catch (e) {
      emit(PracticeSessionsError(message: e.toString()));
    }
  }
}
