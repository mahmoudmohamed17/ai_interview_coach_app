import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterviewResultsSummaryWidget extends StatelessWidget {
  const InterviewResultsSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final recentSessionCubit = context.read<RecentSessionsCubit>();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          /// Header
          Text(
            'Interview Summary',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 2),

          /// Topic and Difficulty
          Row(
            spacing: 52,
            children: [
              _buildSummaryItem(
                context,
                label: 'Topic',
                icon: FontAwesomeIcons.bookOpen,
                labelValue: recentSessionCubit.getCurrentTopic?.topic ?? '',
              ),
              _buildDifficultyItem(
                context,
                difficultyLevel: recentSessionCubit.gerCurrentLevel?.level,
              ),
            ],
          ),

          /// Time spent and Questions answered
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 52,
            children: [
              _buildSummaryItem(
                context,
                label: 'Time Spent',
                icon: FontAwesomeIcons.clock,
                labelValue: recentSessionCubit.getTimeSpent ?? '',
              ),
              _buildSummaryItem(
                context,
                label: 'Questions Answered',
                icon: FontAwesomeIcons.circleCheck,
                labelValue:
                    '${recentSessionCubit.getAnsweredQuestions}/${recentSessionCubit.gerCurrentLevel!.questionsNumber}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(
    BuildContext context, {
    required String label,
    required IconData icon,
    required String labelValue,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            Icon(
              icon,
              size: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        SizedBox(
          width: context.width * 0.25,
          child: Text(
            labelValue,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDifficultyItem(BuildContext context, {String? difficultyLevel}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            Icon(
              FontAwesomeIcons.bullseye,
              size: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              'Difficulty',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          padding: const EdgeInsets.all(4),
          child: Text(
            difficultyLevel ?? '',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
