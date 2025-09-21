import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/cubits/quiz_cubit.dart';
import 'package:ai_interview_coach_app/cubits/quiz_states.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

class CustomQuizSubmitDialog extends StatelessWidget {
  const CustomQuizSubmitDialog({
    super.key,
    required this.timerCubit,
    required this.selectedAnswers,
  });

  final TimerCubit timerCubit;
  final Map<int, String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();
    final recentSessionsCubit = context.read<RecentSessionsCubit>();

    return BlocBuilder<QuizCubit, QuizStates>(
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state is QuizLoading,
          child: AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            icon: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 24,
              child: Icon(
                FontAwesomeIcons.clock,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            title: Text(
              timerCubit.getElapsedTime(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                Text(
                  'Are you sure to submit your answers?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 16,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.pop();
                          timerCubit.resumeTimer();
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            AppColors.redBtnColor,
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'No',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          final answers = selectedAnswers.entries
                              .map(
                                (item) => AnswerModel(
                                  questionId: item.key,
                                  answer: item.value,
                                ),
                              )
                              .toList();
                          recentSessionsCubit.answeredQuestions =
                              selectedAnswers.length;
                          recentSessionsCubit.timeSpent = timerCubit
                              .getElapsedTime();
                          await quizCubit.submitAnswers(answers: answers);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primary,
                          ),
                          shape: const WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Submit',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
