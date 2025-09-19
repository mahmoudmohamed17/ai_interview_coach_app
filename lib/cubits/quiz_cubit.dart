import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/quiz_config_model.dart';
import 'package:ai_interview_coach_app/ai/services/gemini_service.dart';
import 'package:ai_interview_coach_app/cubits/quiz_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// To fetch and submit the questions to [GeminiService]
class QuizCubit extends Cubit<QuizStates> {
  QuizCubit(this.geminiService) : super(const QuizInitial());

  final GeminiService geminiService;

  Future<void> fetchQuestions({
    required String topic,
    required int questionsCount,
    required String difficultyLevel,
  }) async {
    emit(const QuizLoading());
    try {
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

  Future<void> getFeedback({
    required List<Map<String, dynamic>> answers,
  }) async {
    emit(const QuizLoading());
    try {
      final data = answers.map((item) => AnswerModel.fromJson(item)).toList();
      final feedback = await geminiService.submitAnswers(answers: data);
      emit(QuizSubmitted(feedback: feedback));
    } catch (e) {
      emit(QuizFailed(message: e.toString()));
    }
  }
}
