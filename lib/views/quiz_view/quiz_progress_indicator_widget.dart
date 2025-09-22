import 'package:flutter/material.dart';

class QuizProgressIndicatorWidget extends StatelessWidget {
  const QuizProgressIndicatorWidget({
    super.key,
    required this.questionCount,
    required this.currentIndex,
  });
  final int questionCount;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(questionCount, (index) {
        final isActive = index <= currentIndex;
        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
            height: 4,
            decoration: BoxDecoration(
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(index == 0 ? 4 : 0),
                bottomLeft: Radius.circular(index == 0 ? 4 : 0),
                topRight: Radius.circular(index == questionCount - 1 ? 4 : 0),
                bottomRight: Radius.circular(
                  index == questionCount - 1 ? 4 : 0,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
