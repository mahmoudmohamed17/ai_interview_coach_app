import 'package:ai_interview_coach_app/views/quiz_view/custom_quiz_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizNavigationButtons extends StatelessWidget {
  const QuizNavigationButtons({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.answeredQuestions,
    required this.totalQuestions,
  });
  final PageController pageController;
  final int currentIndex;
  final int answeredQuestions;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
      children: [
        Opacity(
          opacity: currentIndex == 0 ? 0 : 1,
          child: Flexible(
            child: CustomQuizIconButton(
              onPressed: () {
                if (currentIndex > 0) {
                  pageController.animateToPage(
                    currentIndex - 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.ease,
                  );
                }
              },
              label: 'Previous',
              icon: Icons.arrow_back,
              btnColor: Theme.of(context).colorScheme.surface,
              labelColor: Theme.of(context).colorScheme.secondary,
              borderColor: Theme.of(context).colorScheme.outline,
              iconColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        Text(
          '$answeredQuestions of $totalQuestions answered',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Flexible(
          child: CustomQuizIconButton(
            onPressed: () {
              if (currentIndex < totalQuestions) {
                pageController.animateToPage(
                  currentIndex + 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              }
            },
            label: currentIndex == totalQuestions - 1 ? 'Complete' : 'Next',
            icon: currentIndex == totalQuestions - 1
                ? FontAwesomeIcons.circleCheck
                : Icons.arrow_forward,
            btnColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            iconColor: Theme.of(context).colorScheme.onPrimary,
            iconAlignment: IconAlignment.end,
          ),
        ),
      ],
    );
  }
}
