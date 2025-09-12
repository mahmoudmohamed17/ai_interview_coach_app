import 'package:ai_interview_coach_app/views/quiz_view/custom_radio_button.dart';
import 'package:flutter/material.dart';

class AnswersItemWidget extends StatefulWidget {
  const AnswersItemWidget({super.key, this.onSelected});
  final Function(String answer)? onSelected;

  @override
  State<AnswersItemWidget> createState() => _AnswersItemWidgetState();
}

class _AnswersItemWidgetState extends State<AnswersItemWidget> {
  int _activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final answers = [
      'A. First answer',
      'B. Second answer',
      'C. Third answer',
      'D. Fourth answer',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      // padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          answers.length,
          (index) => CustomRadioButton(
            isActicve: index == _activeIndex,
            onTap: () => setState(() {
              _activeIndex = index;
              widget.onSelected?.call(answers[index].substring(0, 1));
            }),
            answer: answers[index],
          ),
        ),
      ),
    );
  }
}
