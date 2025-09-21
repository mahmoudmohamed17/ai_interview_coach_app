import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_state.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_results_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

class InterviewResultsView extends StatelessWidget {
  const InterviewResultsView({super.key, required this.feedback});
  final FeedbackModel feedback;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecentSessionsCubit, RecentSessionsState>(
      listener: (context, state) {
        if (state is PracticeSessionsFilled) {
          context.go(Routes.homeView);
        }
        if (state is PracticeSessionsFilled) {
          showToast(context, title: 'Error saving the session data');
        }
      },
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state is PracticeSessionsRefreshing,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(child: InterviewResultsViewBody(feedback: feedback)),
          ),
        );
      },
    );
  }
}
