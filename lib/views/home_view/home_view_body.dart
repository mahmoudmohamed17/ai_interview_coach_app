import 'package:ai_interview_coach_app/views/home_view/advantages_section.dart';
import 'package:ai_interview_coach_app/views/home_view/home_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/home_view/recent_practice_sessions_section.dart';
import 'package:ai_interview_coach_app/views/home_view/statistics_section.dart';
import 'package:ai_interview_coach_app/views/home_view/welcome_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        HomeViewAppBar(),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: WelcomeSection(),
        ),
        SizedBox(height: 24),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: AdvantagesSection(),
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: RecentPracticeSessionsSection(),
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: StatisticsSection(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
