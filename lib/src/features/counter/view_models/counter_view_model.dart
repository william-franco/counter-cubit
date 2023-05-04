// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterViewModel extends Cubit<int> {
  CounterViewModel() : super(0);

  void increment() {
    emit(state + 1);
    _debug();
  }

  void decrement() {
    emit(state > 0 ? state - 1 : 0);
    _debug();
  }

  void _debug() {
    log('Counter: $state');
  }
}
