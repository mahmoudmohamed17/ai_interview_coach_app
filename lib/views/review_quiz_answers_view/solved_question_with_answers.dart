import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/question_item_widget.dart';
import 'package:ai_interview_coach_app/views/review_quiz_answers_view/answer_explanation_widget.dart';
import 'package:ai_interview_coach_app/views/review_quiz_answers_view/solved_answer_item.dart';
import 'package:flutter/widgets.dart';

class SolvedQuestionWithAnswers extends StatelessWidget {
  const SolvedQuestionWithAnswers({
    super.key,
    required this.questionModel,
    required this.remainingQuestions,
    required this.answerModel,
  });

  final QuestionModel questionModel;
  final AnswerModel answerModel;
  final int remainingQuestions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          QuestionItemWidget(
            id: questionModel.id,
            question: questionModel.question,
            remainingQuestions: remainingQuestions,
          ),
          SolvedAnswerItem(
            answers: questionModel.choices,
            correctAnswer: questionModel.correctChoice,
            userAnswer: answerModel.answer,
          ),
          if (answerModel.answer != questionModel.correctChoice)
            AnswerExplanationWidget(explanation: questionModel.explanation),
        ],
      ),
    );
  }
}
