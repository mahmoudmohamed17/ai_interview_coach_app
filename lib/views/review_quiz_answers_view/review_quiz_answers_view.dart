import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/views/review_quiz_answers_view/review_quiz_answers_view_body.dart';
import 'package:flutter/material.dart';

class ReviewQuizAnswersView extends StatelessWidget {
  const ReviewQuizAnswersView({
    super.key,
    required this.questions,
    required this.answers,
  });

  final List<QuestionModel> questions;
  final List<AnswerModel> answers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: ReviewQuizAnswersViewBody(
          questions: questions,
          answers: answers,
        ),
      ),
    );
  }
}
