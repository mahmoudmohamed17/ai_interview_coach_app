import 'package:ai_interview_coach_app/backend/models/statistics_model.dart';
import 'package:flutter/material.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({super.key, required this.model});
  final StatisticsModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: model.color,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          model.subTitle,
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
