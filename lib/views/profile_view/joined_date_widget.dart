import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class JoinedDateWidget extends StatelessWidget {
  const JoinedDateWidget({super.key, required this.joinedData});
  final String joinedData;

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'yMMMM',
      'en_US',
    ).format(DateTime.parse(joinedData));

    return Row(
      spacing: 8,
      children: [
        Icon(
          FontAwesomeIcons.calendar,
          color: Theme.of(context).colorScheme.secondary,
          size: 16,
        ),
        Text(
          'Joined $formattedDate',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
