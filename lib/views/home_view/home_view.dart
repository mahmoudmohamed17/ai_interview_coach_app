import 'package:ai_interview_coach_app/views/home_view/home_view_body.dart';
import 'package:ai_interview_coach_app/views/quiz_view/review_quiz_floating_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: const SafeArea(child: HomeViewBody()),
        ),
        ReviewQuizFloatingButton(),
      ],
    );
  }
}
