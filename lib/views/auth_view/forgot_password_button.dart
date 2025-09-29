import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: TextButton(
        onPressed: () {},
        style: const ButtonStyle(
          visualDensity: VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        child: Text(
          'Forgot password?',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
