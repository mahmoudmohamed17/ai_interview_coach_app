import 'package:ai_interview_coach_app/cubits/timer_cubit.dart';
import 'package:ai_interview_coach_app/cubits/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizTimerWigdet extends StatelessWidget {
  const QuizTimerWigdet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(FontAwesomeIcons.clock, size: 12),
            SizedBox(
              width: 42,
              child: Text(
                state.elapsedTime,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
