import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/core/di/setup_locator.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/cubits/quiz_cubit.dart';
import 'package:ai_interview_coach_app/cubits/quiz_states.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/timer_cubit.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:toastification/toastification.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key, required this.questions});
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    final recentSessionsCubit = context.read<RecentSessionsCubit>();

    return BlocProvider(
      create: (context) => getIt.get<TimerCubit>()..startTimer(),
      child: BlocConsumer<QuizCubit, QuizStates>(
        listener: (context, state) {
          if (state is QuizSubmitted) {
            // To store the current feedback to add the quiz session
            recentSessionsCubit.currentFeedback = state.feedback;

            context.push(Routes.interviewResultsView, extra: state.feedback);
          }
          if (state is QuizFailed) {
            showToast(
              context,
              title: 'Error submitting the answers',
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return LoadingOverlay(
            isLoading: state is QuizLoading,
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: SafeArea(child: QuizViewBody(questions: questions)),
            ),
          );
        },
      ),
    );
  }
}
