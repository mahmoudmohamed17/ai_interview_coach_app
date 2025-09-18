import 'package:ai_interview_coach_app/backend/models/advantage_item_model.dart';
import 'package:flutter/material.dart';

class AdvantageItem extends StatelessWidget {
  const AdvantageItem({super.key, required this.model});
  final AdvantageItemModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Container(
            decoration: BoxDecoration(
              color: model.iconbackgrnColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Icon(model.icon, color: model.iconColor),
          ),
          Text(
            model.text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            model.subText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
