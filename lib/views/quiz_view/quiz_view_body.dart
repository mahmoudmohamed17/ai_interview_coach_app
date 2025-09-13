import 'package:ai_interview_coach_app/views/quiz_view/progress_bar_and_questions_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_view_app_bar.dart';
import 'package:flutter/material.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuizViewAppBar(),
        SizedBox(height: 12),
        Expanded(child: ProgressBarAndQuestionsWidget()),
      ],
    );
  }
}
