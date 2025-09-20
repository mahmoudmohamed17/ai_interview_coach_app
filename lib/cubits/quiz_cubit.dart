import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/ai/models/quiz_config_model.dart';
import 'package:ai_interview_coach_app/ai/services/gemini_service.dart';
import 'package:ai_interview_coach_app/cubits/quiz_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// To fetch and submit the questions to [GeminiService]
class QuizCubit extends Cubit<QuizStates> {
  QuizCubit(this.geminiService) : super(const QuizInitial());

  final GeminiService geminiService;

  FeedbackModel? _feedbackModel;

  FeedbackModel? get feedbackModel => _feedbackModel;
  set (FeedbackModel model) => _feedbackModel = model;

  Future<void> fetchQuestions({
    required String topic,
    required int questionsCount,
    required String difficultyLevel,
  }) async {
    emit(const QuizLoading());
    try {
      _topic = topic;
      _questionsCount = questionsCount;
      _difficultyLevel = difficultyLevel;

      final model = QuizConfigModel(
        topic: topic,
        questionsCount: questionsCount,
        difficultyLevel: difficultyLevel,
      );
      final questions = await geminiService.getQuestions(
        quizConfigModel: model,
      );
      emit(QuizLoaded(questions: questions));
    } catch (e) {
      emit(QuizFailed(message: e.toString()));
    }
  }

  Future<void> submitAnswers({required List<AnswerModel> answers}) async {
    emit(const QuizLoading());
    try {
      _feedbackModel = await geminiService.submitAnswers(answers: answers);
      clearChat();
      emit(QuizSubmitted(feedback: _feedbackModel!));
    } catch (e) {
      emit(QuizFailed(message: e.toString()));
    }
  }

  void clearChat() {
    geminiService.clearChat();
  }

  void resetVariables() {
    _topic = null;
    _questionsCount = null;
    _answeredQuestions = null;
    _difficultyLevel = null;
    _timeSpent = null;
  }

  String? _topic;
  int? _questionsCount;
  int? _answeredQuestions;
  String? _difficultyLevel;
  String? _timeSpent;

  String? get getTopic => _topic;
  int? get getQuestionsCount => _questionsCount;
  int? get getAnsweredQuestions => _answeredQuestions;
  String? get getDifficultyLevel => _difficultyLevel;
  String? get getTimeSpent => _timeSpent;

  set setTopic(String? topic) => _topic = topic;
  set setTimeSpent(String? timeSpent) => _timeSpent = timeSpent;
  set setQuestionsCount(int? questionsCount) =>
      _questionsCount = questionsCount;
  set setAnsweredQuestions(int? answeredQuestions) =>
      _answeredQuestions = answeredQuestions;
  set setDifficultyLevel(String? difficultyLevel) =>
      _difficultyLevel = difficultyLevel;
}
