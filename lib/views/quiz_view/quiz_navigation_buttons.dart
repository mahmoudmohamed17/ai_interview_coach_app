import 'package:ai_interview_coach_app/cubits/timer_cubit.dart';
import 'package:ai_interview_coach_app/views/quiz_view/custom_quiz_icon_button.dart';
import 'package:ai_interview_coach_app/views/quiz_view/custom_quiz_submit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizNavigationButtons extends StatelessWidget {
  const QuizNavigationButtons({
    super.key,
    required this.pageController,
    required this.currentIndex,
    required this.selectedAnswers,
    required this.totalQuestions,
  });
  final PageController pageController;
  final int currentIndex;
  final Map<int, String> selectedAnswers;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    final timerCubit = context.read<TimerCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 8,
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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '${selectedAnswers.length} of $totalQuestions answered',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        CustomQuizIconButton(
          onPressed: () async {
            if (currentIndex == totalQuestions - 1) {
              timerCubit.pauseTimer();
              showDialog(
                context: context,
                builder: (context) => CustomQuizSubmitDialog(
                  timerCubit: timerCubit,
                  selectedAnswers: selectedAnswers,
                ),
              );
            } else {
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
      ],
    );
  }
}
