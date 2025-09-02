// import 'package:ai_interview_coach_app/core/constants/app_assets.dart';
// import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
// import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/views/home_view/home_view_advantages_section.dart';
import 'package:ai_interview_coach_app/views/home_view/home_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/home_view/home_view_welcome_section.dart';
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
          child: HomeViewWelcomeSection(),
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: HomeViewAdvantagesSection(),
        ),
      ],
    );
  }
}
