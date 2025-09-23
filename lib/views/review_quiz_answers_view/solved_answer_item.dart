import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SolvedAnswerItem extends StatelessWidget {
  const SolvedAnswerItem({
    super.key,
    required this.answers,
    required this.correctAnswer,
    required this.userAnswer,
  });
  final List<String> answers;
  final String correctAnswer;
  final String userAnswer;

  @override
  Widget build(BuildContext context) {
    final correctIndex = answers.indexWhere(
      (answer) => answer.substring(0, 1) == correctAnswer,
    );

    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        answers.length,
        (index) => _buildButton(
          context,
          answer: answers[index],
          isCorrect: index == correctIndex,
          isUserChoice: answers[index].substring(0, 1) == userAnswer,
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String answer,
    required bool isCorrect,
    required bool isUserChoice,
  }) {
    Color borderColor = Theme.of(context).colorScheme.outline;
    IconData icon = Icons.radio_button_off;

    if (isCorrect) {
      borderColor = Colors.green;
      icon = FontAwesomeIcons.solidCircleCheck;
    }

    if (isUserChoice && !isCorrect) {
      borderColor = Colors.red;
      icon = FontAwesomeIcons.solidCircleXmark;
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: borderColor),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Icon(icon, color: borderColor),
          Expanded(
            child: Text(
              answer,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: borderColor,
                fontWeight: FontWeight.w600,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
