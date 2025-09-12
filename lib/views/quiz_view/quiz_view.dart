import 'package:ai_interview_coach_app/views/quiz_view/quiz_view_body.dart';
import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const SafeArea(child: QuizViewBody()),
    );
  }
}
