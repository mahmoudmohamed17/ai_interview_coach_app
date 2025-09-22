import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/generate_color.dart';
import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:intl/intl.dart';

class ExpandedPracticeSessionItem extends StatelessWidget {
  const ExpandedPracticeSessionItem({super.key, required this.model});

  final QuizSessionModel model;

  @override
  Widget build(BuildContext context) {
    final color = generateColor(model.score!);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          // Header Row
          Row(
            spacing: 12,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.blueTintIconColor,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  FontAwesomeIcons.play,
                  color: AppColors.blueIconColor,
                  size: 20,
                ),
              ),
              Expanded(
                child: Text(
                  model.topic ?? "Unknown Topic",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${model.score!.round()}% Score',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          // Details Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoChip(
                context,
                icon: FontAwesomeIcons.clock,
                text: "${model.totalQuestions} Questions",
              ),
              _infoChip(
                context,
                icon: FontAwesomeIcons.solidCalendar,
                text: DateFormat("d MMM, h:mm a").format(model.createdAt!),
              ),
              _infoChip(
                context,
                icon: FontAwesomeIcons.solidStar,
                text: model.difficulty ?? "N/A",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoChip(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    return Row(
      spacing: 4,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: Theme.of(context).colorScheme.secondary),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
