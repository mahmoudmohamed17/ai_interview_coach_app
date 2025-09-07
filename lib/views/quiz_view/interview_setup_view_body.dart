import 'package:ai_interview_coach_app/views/quiz_view/interview_steup_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/quiz_view/select_interview_topic_widget.dart';
import 'package:flutter/material.dart';

class InterviewSetupViewBody extends StatelessWidget {
  const InterviewSetupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        InterviewSteupViewAppBar(),
        SizedBox(height: 24),
        SelectInterviewTopicWidget(),
      ],
    );
  }
}
