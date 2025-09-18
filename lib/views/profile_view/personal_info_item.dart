import 'package:ai_interview_coach_app/backend/models/user_personal_info_model.dart';
import 'package:flutter/material.dart';

class PersonalInfoItem extends StatelessWidget {
  const PersonalInfoItem({super.key, required this.model});
  final UserPersonalInfoModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Icon(
              model.icon,
              size: 18,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            Text(
              model.label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          model.value,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
