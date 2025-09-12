// import 'package:ai_interview_coach_app/views/quiz_view/quiz_timer_wigdet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuizViewAppBar extends StatelessWidget {
  const QuizViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back),
          ),
          Text(
            'Interview in Progress',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const Spacer(),
          // const QuizTimerWigdet(),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
