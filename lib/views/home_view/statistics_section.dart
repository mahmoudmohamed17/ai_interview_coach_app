import 'package:ai_interview_coach_app/backend/models/statistics_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/views/home_view/statistics_item.dart';
import 'package:flutter/material.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      StatisticsModel(
        title: '127',
        subTitle: 'Questions Practiced',
        color: AppColors.blueIconColor,
      ),
      StatisticsModel(
        title: '89%',
        subTitle: 'Average Score',
        color: AppColors.greenIconColor,
      ),
      StatisticsModel(
        title: '12',
        subTitle: 'Skills Improved',
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
            .map((item) => Expanded(child: StatisticsItem(model: item)))
            .toList(),
      ),
    );
  }
}
