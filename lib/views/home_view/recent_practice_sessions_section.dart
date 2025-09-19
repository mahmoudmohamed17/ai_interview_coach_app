import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_state.dart';
import 'package:ai_interview_coach_app/views/home_view/recent_practice_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RecentPracticeSessionsSection extends StatelessWidget {
  const RecentPracticeSessionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentSessionsCubit, RecentSessionsState>(
      builder: (context, state) {
        if (state is PracticeSessionsInitial) {
          return _buildEmptyState(context);
        } else if (state is PracticeSessionsFilled) {
          return _buildFilledState(context, sessions: state.currentSessions);
        } else if (state is PracticeSessionsRefreshing) {
          return _buildFilledState(context, sessions: state.currentSessions);
        } else if (state is PracticeSessionsError) {
          return _buildErrorState(context);
        } else {
          return _buildLoadingState(context);
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
                '${sessions.length} This week',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        ...sessions.map((item) => RecentPracticeItem(model: item)),
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
