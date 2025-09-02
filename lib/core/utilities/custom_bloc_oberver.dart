import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocOberver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('Change: $change in Bloc: $bloc');
  }

  @override
  void onClose(BlocBase bloc) {
    log('Close $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('Create: $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('Error: $error in Bloc: $bloc');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('Event: $event in Bloc: $bloc');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('Transition: $transition in Bloc: $bloc');
  }
}
