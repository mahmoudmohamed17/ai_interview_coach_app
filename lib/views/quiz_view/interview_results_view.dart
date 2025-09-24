import 'dart:developer';

import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_loading_indicator_dialog.dart';
import 'package:ai_interview_coach_app/cubits/quiz_cubit.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_state.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_results_view_body.dart';
import 'package:ai_interview_coach_app/views/quiz_view/review_quiz_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InterviewResultsView extends StatelessWidget {
  const InterviewResultsView({super.key, required this.feedback});
  final FeedbackModel feedback;

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();
    // To test which question is answered or even skipped
    log(
      'Questions IDs: ${quizCubit.getSessionQuestions?.map((e) => e.id).toList()}',
    );
    // Also to check the answers list to try find which question is skipped
    log(
      'Answers Question choice: ${quizCubit.getSessionAnswers?.map((e) => e.answer).toList()}',
    );
    return BlocConsumer<RecentSessionsCubit, RecentSessionsState>(
      listener: (context, state) {
        if (state is PracticeSessionAdded) {
          context.go(Routes.homeView);
        }

        if (state is PracticeSessionsNavigating) {
          context.go(Routes.interviewSetupView);
        }

        if (state is PracticeSessionError) {
          showToast(context, title: 'Error saving the session data');
        }
      },
      builder: (context, state) {
        return CustomLoadingIndicatorDialog(
          isLoading: state is PracticeSessionsRefreshing,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Theme.of(context).colorScheme.surface,
                body: SafeArea(
                  child: InterviewResultsViewBody(feedback: feedback),
                ),
              ),
              ReviewQuizFloatingButton(
                questions: quizCubit.getSessionQuestions!,
                answers: quizCubit.getSessionAnswers!,
              ),
            ],
          ),
        );
      },
    );
  }
}
