import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_state.dart';
import 'package:ai_interview_coach_app/views/home_view/recent_practice_item.dart';
import 'package:ai_interview_coach_app/views/home_view/recent_practice_sessions_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class RecentPracticeSessionsSection extends StatelessWidget {
  const RecentPracticeSessionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecentSessionsCubit, RecentSessionsState>(
      listenWhen: (previous, current) =>
          current is PracticeSessionAdded ||
          current is PracticeSessionDeleted ||
          current is PracticeSessionsNavigating,
      listener: (context, state) {
        if (state is PracticeSessionAdded) {}
        if (state is PracticeSessionDeleted) {}
        if (state is PracticeSessionsNavigating) {}
      },
      buildWhen: (previous, current) =>
          current is PracticeSessionsInitial ||
          current is PracticeSessionsFilled ||
          current is PracticeSessionsRefreshing ||
          current is PracticeSessionsError ||
          current is PracticeSessionsLoading,
      builder: (context, state) {
        if (state is PracticeSessionsInitial) {
          return _buildEmptyState(context);
        } else if (state is PracticeSessionsFilled) {
          return _buildFilledState(context, sessions: state.currentSessions);
        } else if (state is PracticeSessionsRefreshing) {
          return _buildFilledState(context, sessions: state.currentSessions);
        } else if (state is PracticeSessionsError) {
          return _buildErrorState(context);
        } else if (state is PracticeSessionsLoading) {
          return _buildLoadingState(context);
        } else {
          return _buildEmptyState(context);
        }
      },
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return SpinKitThreeBounce(
      color: Theme.of(context).colorScheme.onSurface,
      size: 20,
      duration: const Duration(milliseconds: 500),
    );
  }

  Widget _buildFilledState(
    BuildContext context, {
    required List<QuizSessionModel> sessions,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        RecentPracticeSessiosHeader(sessions: sessions),
        sessions.length > 3
            ? Column(
                spacing: 16,
                children: [
                  ...sessions
                      .sublist(0, 3)
                      .map((item) => RecentPracticeItem(model: item)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => context.push(
                        Routes.recentPracticeSessionsView,
                        extra: sessions,
                      ),
                      customBorder: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'See all',
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                spacing: 16,
                children: sessions
                    .map((item) => RecentPracticeItem(model: item))
                    .toList(),
              ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Row(
          children: [
            Text(
              'Recent Practice Sessions',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Text(
          'Something went wrong',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Practice Sessions',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              padding: const EdgeInsets.all(6.0),
              child: Text(
                '0 This week',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Text(
          'You don\'t have any recent practices yet',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
