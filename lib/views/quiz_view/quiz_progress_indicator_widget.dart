import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:flutter/material.dart';

class QuizProgressIndicatorWidget extends StatelessWidget {
  const QuizProgressIndicatorWidget({super.key, required this.barPercentage});
  final double barPercentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 4,
          width: context.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: 4,
            width: context.width * barPercentage,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
          ),
        ),
      ],
    );
  }
}
