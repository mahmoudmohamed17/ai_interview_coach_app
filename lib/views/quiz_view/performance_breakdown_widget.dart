import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/backend/models/performance_breackdown_model.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/utilities/generate_color.dart';
import 'package:flutter/material.dart';

class PerformanceBreakdownWidget extends StatelessWidget {
  const PerformanceBreakdownWidget({super.key, required this.feedback});

  final FeedbackModel feedback;

  @override
  Widget build(BuildContext context) {
    final items = [
      PerformanceBreakdownModel(
        category: 'Technical Knowledge',
        score: feedback.technicalKnowledge,
      ),
      PerformanceBreakdownModel(
        category: 'Problem Solving',
        score: feedback.problemSolving,
      ),
      PerformanceBreakdownModel(
        category: 'Best Practices',
        score: feedback.bestPractices,
      ),
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
        spacing: 12,
        children: [
          Text(
            'Performance Breakdown',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          ...items.map(
            (item) => _buildPerformanceItem(
              context,
              category: item.category!,
              score: item.score!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceItem(
    BuildContext context, {
    required String category,
    required double score,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
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
          width: context.width * 0.12,
          alignment: Alignment.center,
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
