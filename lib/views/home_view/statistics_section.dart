import 'package:ai_interview_coach_app/backend/models/statistics_item_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      StatisticsItemModel(
        score: '127',
        category: 'Questions Practiced',
        color: AppColors.blueIconColor,
      ),
      StatisticsItemModel(
        score: '89%',
        category: 'Average Score',
        color: AppColors.greenIconColor,
      ),
      StatisticsItemModel(
        score: '12',
        category: 'Skills Improved',
        color: AppColors.purpleTextColor,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) =>
                  Expanded(child: _buildStatisticsItem(context, model: item)),
            )
            .toList(),
      ),
    );
  }

  Widget _buildStatisticsItem(
    BuildContext context, {
    required StatisticsItemModel model,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Text(
          model.score,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: model.color,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          model.category,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
