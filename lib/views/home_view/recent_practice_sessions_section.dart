import 'package:ai_interview_coach_app/views/home_view/recent_practice_sessions_header.dart';
import 'package:ai_interview_coach_app/views/home_view/recent_practices_list.dart';
import 'package:flutter/material.dart';

class RecentPracticeSessionsSection extends StatelessWidget {
  const RecentPracticeSessionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [RecentPracticeSessiosHeader(), RecentPracticesList()],
    );
  }
}
