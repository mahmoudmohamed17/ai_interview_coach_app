import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/views/home_view/advantages_section.dart';
import 'package:ai_interview_coach_app/views/home_view/home_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/home_view/recent_practice_sessions_section.dart';
import 'package:ai_interview_coach_app/views/home_view/statistics_section.dart';
import 'package:ai_interview_coach_app/views/home_view/welcome_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HomeViewAppBar(),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: WelcomeSection(),
        ),
        const SizedBox(height: 24),
        CustomButton(
          onPressed: () => context.push(Routes.reviewQuizAnswersView),
          child: const Text('Test new view'),
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: AdvantagesSection(),
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: RecentPracticeSessionsSection(),
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: StatisticsSection(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
