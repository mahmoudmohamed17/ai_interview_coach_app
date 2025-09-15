import 'package:ai_interview_coach_app/views/quiz_view/interview_results_summary_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_score_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/inteview_results_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/quiz_view/performance_breakdown_widget.dart';
import 'package:flutter/material.dart';

class InterviewResultsViewBody extends StatelessWidget {
  const InterviewResultsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        InteviewResultsViewAppBar(),
        SizedBox(height: 24),
        InterviewScoreWidget(),
        SizedBox(height: 24),
        InterviewResultsSummaryWidget(),
        SizedBox(height: 24),
        PerformanceBreakdownWidget(),
      ],
    );
  }
}
