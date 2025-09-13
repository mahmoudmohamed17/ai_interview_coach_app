import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/answers_item_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/question_item_widget.dart';
import 'package:flutter/material.dart';

class QuestionAndAnswersWidget extends StatelessWidget {
  const QuestionAndAnswersWidget({
    super.key,
    required this.questionModel,
    required this.remainingQuestions,
    this.selectedAnswer,
    this.onAnswerSelected,
  });
  final QuestionModel questionModel;
  final int remainingQuestions;
  final String? selectedAnswer;
  final Function(String)? onAnswerSelected;

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
          AnswersItemWidget(
            answers: questionModel.choices,
            selectedAnswer: selectedAnswer,
            onSelected: onAnswerSelected,
          ),
        ],
      ),
    );
  }
}
