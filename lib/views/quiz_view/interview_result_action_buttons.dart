import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class InterviewResultsActionButtons extends StatelessWidget {
  const InterviewResultsActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 24,
      children: [
        Expanded(
          child: _buildButton(
            context,
            onPressed: () => context.go(Routes.homeView),
            label: 'Back to Home',
            icon: FontAwesomeIcons.house,
            backgrnColor: Theme.of(context).colorScheme.surface,
            labelColor: Theme.of(context).colorScheme.onSurface,
            borderColor: Theme.of(context).colorScheme.outline,
          ),
        ),
        Expanded(
          child: _buildButton(
            context,
            onPressed: () {},
            label: 'Start New Interview',
            backgrnColor: Theme.of(context).colorScheme.primary,
            labelColor: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required VoidCallback onPressed,
    required String label,
    IconData? icon,
    Color? labelColor,
    Color? backgrnColor,
    Color? borderColor,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgrnColor,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        shadowColor: Colors.transparent,
      ),
      icon: icon != null
          ? Icon(
              FontAwesomeIcons.house,
              size: 16,
              color: Theme.of(context).colorScheme.onSurface,
            )
          : null,
      label: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: labelColor),
      ),
    );
  }
}
