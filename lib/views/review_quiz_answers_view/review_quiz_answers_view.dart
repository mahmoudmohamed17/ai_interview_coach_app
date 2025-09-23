import 'package:ai_interview_coach_app/views/review_quiz_answers_view/review_quiz_answers_view_body.dart';
import 'package:flutter/material.dart';

class ReviewQuizAnswersView extends StatelessWidget {
  const ReviewQuizAnswersView({super.key});

  /// Only need to give this widget the current questions and answers :)
  /// We would pass the data via app routing class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const SafeArea(child: ReviewQuizAnswersViewBody()),
    );
  }
}
