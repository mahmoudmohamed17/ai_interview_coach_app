import 'package:ai_interview_coach_app/views/quiz_view/interview_results_view_body.dart';
import 'package:flutter/material.dart';

class InterviewResultsView extends StatelessWidget {
  const InterviewResultsView({super.key, required this.data});
  final Object data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const SafeArea(child: InterviewResultsViewBody()),
    );
  }
}
