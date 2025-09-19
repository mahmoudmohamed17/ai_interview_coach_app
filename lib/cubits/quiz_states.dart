import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';

abstract class QuizStates {
  const QuizStates();
}

final class QuizInitial extends QuizStates {
  const QuizInitial();
}

final class QuizLoading extends QuizStates {
  const QuizLoading();
}

final class QuizLoaded extends QuizStates {
  final List<QuestionModel> questions;

  const QuizLoaded({required this.questions});
}

final class QuizSubmitted extends QuizStates {
  final FeedbackModel feedback;

  const QuizSubmitted({required this.feedback});
}

final class QuizFailed extends QuizStates {
  final String message;

  const QuizFailed({required this.message});
}
