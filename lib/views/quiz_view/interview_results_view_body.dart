import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/improvement_suggestions_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_result_action_buttons.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_results_summary_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_score_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/inteview_results_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/quiz_view/performance_breakdown_widget.dart';
import 'package:flutter/material.dart';

class InterviewResultsViewBody extends StatelessWidget {
  const InterviewResultsViewBody({super.key, required this.feedback});
  final FeedbackModel feedback;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const InteviewResultsViewAppBar(),
        const SizedBox(height: 24),
        InterviewScoreWidget(feedback: feedback),
        const SizedBox(height: 24),
        const InterviewResultsSummaryWidget(),
        const SizedBox(height: 24),
        PerformanceBreakdownWidget(feedback: feedback),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: InterviewResultsActionButtons(),
        ),
        const SizedBox(height: 16),
        ImprovementSuggestionsWidget(
          suggestions: feedback.suggestionsForImprovement,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
