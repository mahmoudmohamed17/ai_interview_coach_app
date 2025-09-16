import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterviewResultsSummaryWidget extends StatelessWidget {
  const InterviewResultsSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                labelValue: 'System Design',
              ),
              _buildDifficultyItem(context),
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
                labelValue: '7m 21s',
              ),
              _buildSummaryItem(
                context,
                label: 'Questions Answered',
                icon: FontAwesomeIcons.circleCheck,
                labelValue: '7/8',
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

  Widget _buildDifficultyItem(BuildContext context) {
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
            'Beginner',
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
