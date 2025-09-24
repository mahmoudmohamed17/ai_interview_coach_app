import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/question_item_widget.dart';
import 'package:ai_interview_coach_app/views/review_quiz_answers_view/answer_explanation_widget.dart';
import 'package:ai_interview_coach_app/views/review_quiz_answers_view/solved_answer_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    final isSkipped = answerModel.status == AnswerStatus.skipped;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          isSkipped
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: _skippedWidget(context),
                )
              : const SizedBox.shrink(),
          QuestionItemWidget(
            id: questionModel.id,
            question: questionModel.question,
            remainingQuestions: remainingQuestions,
          ),
          SolvedAnswerItem(
            answers: questionModel.choices,
            correctAnswer: questionModel.correctChoice,
            userAnswer: isSkipped
                ? questionModel.correctChoice
                : answerModel.answer!,
          ),
          if (!isSkipped && answerModel.answer! != questionModel.correctChoice)
            AnswerExplanationWidget(explanation: questionModel.explanation),
        ],
      ),
    );
  }

  Widget _skippedWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
          Text(
            'Skipped',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
