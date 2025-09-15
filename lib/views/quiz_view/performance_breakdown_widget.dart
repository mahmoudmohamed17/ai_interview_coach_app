import 'package:ai_interview_coach_app/backend/models/performance_breakdown_model.dart';
import 'package:ai_interview_coach_app/core/utilities/generate_color.dart';
import 'package:flutter/material.dart';

class PerformanceBreakdownWidget extends StatelessWidget {
  const PerformanceBreakdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      PerformanceBreakdownModel(label: 'Technical Knowledge', score: 85),
      PerformanceBreakdownModel(label: 'Problem Solving', score: 82),
      PerformanceBreakdownModel(label: 'Communication', score: 71),
      PerformanceBreakdownModel(label: 'Best Practices', score: 93),
    ];
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
        spacing: 18,
        children: [
          Text(
            'Performance Breakdown',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          
          // Spread Operator
          ...items.map(
            (item) => _buildPerformanceItem(
              context,
              label: item.label,
              score: item.score,
            ),
          ),
        ],
      ),
    );
  }

  Row _buildPerformanceItem(
    BuildContext context, {
    required String label,
    required double score,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: generateColor(score)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            '${score.toStringAsFixed(0)}%',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: generateColor(score),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
