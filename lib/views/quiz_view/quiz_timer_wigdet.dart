import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizTimerWigdet extends StatefulWidget {
  const QuizTimerWigdet({super.key, this.onCompleted});
  final Function(String)? onCompleted;

  @override
  State<QuizTimerWigdet> createState() => _QuizTimerWigdetState();
}

class _QuizTimerWigdetState extends State<QuizTimerWigdet> {
  Stopwatch? _stopwatch;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _stopwatch = Stopwatch()..start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    widget.onCompleted?.call(_formatTime(_stopwatch!.elapsed));
    _timer!.cancel();
    _stopwatch!.stop();
    super.dispose();
  }

  String _formatTime(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(FontAwesomeIcons.clock, size: 12),
        SizedBox(
          width: 42,
          child: Text(
            _formatTime(_stopwatch!.elapsed),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
