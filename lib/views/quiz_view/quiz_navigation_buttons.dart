import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/custom_quiz_icon_button.dart';
import 'package:flutter/material.dart';

class QuizNavigationButtons extends StatelessWidget {
  const QuizNavigationButtons({
    super.key,
    required this.pageController,
    required this.currentIndex,
  });
  final PageController pageController;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
          opacity: currentIndex == 0 ? 0 : 1,
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
        Text(
          '${currentIndex + 1} of 4 answered',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        CustomQuizIconButton(
          onPressed: () {
            if (currentIndex < dummyQuestions.length) {
              pageController.animateToPage(
                currentIndex + 1,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease,
              );
            }
          },
          label: 'Next',
          icon: Icons.arrow_forward,
          btnColor: Theme.of(context).colorScheme.primary,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          iconColor: Theme.of(context).colorScheme.onPrimary,
          iconAlignment: IconAlignment.end,
        ),
      ],
    );
  }
}
