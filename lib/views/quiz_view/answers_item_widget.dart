import 'package:ai_interview_coach_app/views/quiz_view/custom_radio_button.dart';
import 'package:flutter/material.dart';

class AnswersItemWidget extends StatelessWidget {
  const AnswersItemWidget({
    super.key,
    this.onSelected,
    required this.answers,
    this.selectedAnswer,
  });

  final Function(String answer)? onSelected;
  final String? selectedAnswer;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    int activeIndex = -1;
    if (selectedAnswer != null) {
      activeIndex = answers.indexWhere(
        (answer) => answer.substring(0, 1) == selectedAnswer,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          answers.length,
          (index) => CustomRadioButton(
            isActicve: index == activeIndex,
            onTap: () {
              onSelected?.call(answers[index].substring(0, 1));
            },
            answer: answers[index],
          ),
        ),
      ),
    );
  }
}
