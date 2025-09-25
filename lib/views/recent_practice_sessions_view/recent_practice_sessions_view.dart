import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_state.dart';
import 'package:ai_interview_coach_app/views/recent_practice_sessions_view/expanded_practice_session_item.dart';
import 'package:ai_interview_coach_app/views/recent_practice_sessions_view/recent_practice_sessions_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:toastification/toastification.dart';

class RecentPracticeSessionsView extends StatelessWidget {
  const RecentPracticeSessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecentSessionsCubit, RecentSessionsState>(
      listener: (context, state) {
        if (state is PracticeSessionsInitial) {
          showToast(
            context,
            title: 'All sessions have beed deleted successfully!',
          );
        }
        if (state is PracticeSessionError) {
          showToast(
            context,
            title: 'Error while removing the sessions',
            type: ToastificationType.error,
          );
        }
      },
      buildWhen: (previous, current) =>
          current is PracticeSessionsInitial ||
          current is PracticeSessionsFilled ||
          current is PracticeSessionsRefreshing ||
          current is PracticeSessionsLoading,
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state is PracticeSessionsRefreshing,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: ListView(
              children: [
                const RecentPracticeSessionsAppBar(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: () {
                    if (state is PracticeSessionsInitial) {
                      return _buildEmptyState(context);
                    } else if (state is PracticeSessionsFilled) {
                      return _buildFilledState(state.currentSessions);
                    } else if (state is PracticeSessionsRefreshing) {
                      return _buildFilledState(state.currentSessions);
                    } else {
                      return _buildLoadingState(context);
                    }
                  }(),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilledState(List<QuizSessionModel> sessions) {
    return Column(
      spacing: 16,
      children: sessions
          .map((model) => ExpandedPracticeSessionItem(model: model))
          .toList(),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        SpinKitThreeBounce(
          color: Theme.of(context).colorScheme.onSurface,
          size: 20,
          duration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 64),
        Text(
          'You don\'t have any recent practices yet',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
