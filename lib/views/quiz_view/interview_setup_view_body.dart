import 'package:ai_interview_coach_app/backend/models/interview_difficulty_level_model.dart';
import 'package:ai_interview_coach_app/backend/models/interview_topic_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/choose_difficulty_level_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_steup_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_summary_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/select_interview_topic_widget.dart';
import 'package:flutter/material.dart';

class InterviewSetupViewBody extends StatefulWidget {
  const InterviewSetupViewBody({super.key});

  @override
  State<InterviewSetupViewBody> createState() => _InterviewSetupViewBodyState();
}

class _InterviewSetupViewBodyState extends State<InterviewSetupViewBody> {
  InterviewTopicModel? topic;
  InterviewDifficultyLevelModel? level;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const InterviewSteupViewAppBar(),
        const SizedBox(height: 24),
        SelectInterviewTopicWidget(
          onSelected: (value) => setState(() {
            topic = value;
          }),
        ),
        const SizedBox(height: 24),
        ChooseDifficultyLevelWidget(
          onSelected: (value) => setState(() {
            level = value;
          }),
        ),
        const SizedBox(height: 24),
        if (topic != null && level != null)
          InterviewSummaryWidget(topic: topic!, level: level!),
        const SizedBox(height: 24),
      ],
    );
  }
}
