import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JoinedDateWidget extends StatelessWidget {
  const JoinedDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Icon(
          FontAwesomeIcons.calendar,
          color: Theme.of(context).colorScheme.secondary,
          size: 16,
        ),
        Text(
          'Joined March 2024',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
