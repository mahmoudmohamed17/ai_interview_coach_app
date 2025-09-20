import 'dart:async';
import 'package:ai_interview_coach_app/cubits/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerState(elapsedTime: '0:00', isRunning: false)) {
    _startTimer();
  }

  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  void _startTimer() {
    if (!state.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        emit(
          TimerState(
            elapsedTime: _formatTime(_stopwatch.elapsed),
            isRunning: true,
          ),
        );
      });
    }
  }

  void pauseTimer() {
    if (state.isRunning) {
      _stopwatch.stop();
      _timer?.cancel();
      emit(
        TimerState(
          elapsedTime: _formatTime(_stopwatch.elapsed),
          isRunning: false,
        ),
      );
    }
  }

  void resumeTimer() {
    if (!state.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        emit(
          TimerState(
            elapsedTime: _formatTime(_stopwatch.elapsed),
            isRunning: true,
          ),
        );
      });
    }
  }

  void stopTimer() {
    if (state.isRunning) {
      _stopwatch.stop();
      _timer?.cancel();
      emit(
        TimerState(
          elapsedTime: _formatTime(_stopwatch.elapsed),
          isRunning: false,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    _stopwatch.stop();
    _timer?.cancel();
    super.close();
  }

  String getElapsedTime() => _formatTime(_stopwatch.elapsed);

  String _formatTime(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
