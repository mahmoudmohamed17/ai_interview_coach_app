import 'package:ai_interview_coach_app/views/quiz_view/custom_quiz_icon_button.dart';
import 'package:flutter/material.dart';

class QuizNavigationButtons extends StatelessWidget {
  const QuizNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomQuizIconButton(
          onPressed: () {},
          label: 'Previous',
          icon: Icons.arrow_back,
          btnColor: Theme.of(context).colorScheme.surface,
          labelColor: Theme.of(context).colorScheme.secondary,
          borderColor: Theme.of(context).colorScheme.outline,
          iconColor: Theme.of(context).colorScheme.secondary,
        ),
        Text(
          '1 of 8 answered',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        CustomQuizIconButton(
          onPressed: () {},
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
