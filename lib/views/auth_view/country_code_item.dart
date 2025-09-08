import 'package:ai_interview_coach_app/backend/models/country_code_model.dart';
import 'package:flutter/material.dart';

class CountryCodeItem extends StatelessWidget {
  const CountryCodeItem({super.key, required this.model});

  final CountryCodeModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Image.asset(model.flag, height: 20, width: 20),
        Text(
          model.dialCode,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
