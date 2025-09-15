import 'package:ai_interview_coach_app/views/quiz_view/inteview_results_view_app_bar.dart';
import 'package:flutter/material.dart';

class InterviewResultsViewBody extends StatelessWidget {
  const InterviewResultsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [InteviewResultsViewAppBar()]);
  }
}
