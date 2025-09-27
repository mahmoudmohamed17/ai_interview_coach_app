import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/ai/models/quiz_config_model.dart';
import 'package:ai_interview_coach_app/ai/services/gemini_service.dart';
import 'package:ai_interview_coach_app/cubits/quiz_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// To fetch and submit the questions to [GeminiService]
class QuizCubit extends Cubit<QuizStates> {
  QuizCubit(this.geminiService) : super(const QuizInitial());

  final GeminiService geminiService;

  // Used to store the current session questions and answers
  List<QuestionModel>? _sessionQuestions;
  List<AnswerModel>? _sessionAnswers;

  List<QuestionModel>? get getSessionQuestions => _sessionQuestions;
  List<AnswerModel>? get getSessionAnswers => _sessionAnswers;

  set sessionQuestions(List<QuestionModel> questions) =>
      _sessionQuestions = questions;
  set sessionAnswers(List<AnswerModel> answers) => _sessionAnswers = answers;

  Future<void> fetchQuestions({
    required String topic,
    required int questionsCount,
    required String difficultyLevel,
  }) async {
    emit(const QuizLoading());

    final model = QuizConfigModel(
      topic: topic,
      questionsCount: questionsCount,
      difficultyLevel: difficultyLevel,
    );

    final result = await geminiService.getQuestions(quizConfigModel: model);

    result.fold(
      (questions) {
        sessionQuestions = questions;
        emit(QuizLoaded(questions: questions));
      },
      (failure) {
        clearChat();
        emit(QuizFailed(message: failure.message));
      },
    );
  }

  Future<void> submitAnswers({required Map<int, String> answers}) async {
    emit(const QuizLoading());

    // We make the userAnswers list the same length of the questions to make it easy
    // when reviewing the questions and not depend on null and index checking
    final questions = _sessionQuestions;
    final userAnswers = questions!.map((question) {
      final answer = answers[question.id];
      if (answer != null) {
        return AnswerModel(
          questionId: question.id,
          answer: answer,
          status: AnswerStatus.answered,
        );
      } else {
        return AnswerModel(
          questionId: question.id,
          answer: '',
          status: AnswerStatus.skipped,
        );
      }
    }).toList();

    sessionAnswers = userAnswers;

    final result = await geminiService.submitAnswers(answers: userAnswers);

    result.fold(
      (feedback) {
        clearChat();
        emit(QuizSubmitted(feedback: feedback));
      },
      (failure) {
        emit(QuizFailed(message: failure.message));
      },
    );
  }

  void clearChat() {
    geminiService.clearChat();
  }
}
