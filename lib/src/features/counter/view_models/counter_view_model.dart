// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

abstract base class CounterViewModel extends Cubit<int> {
  CounterViewModel() : super(0);

  void increment();
  void decrement();
}

base class CounterViewModelImpl extends Cubit<int> implements CounterViewModel {
  CounterViewModelImpl() : super(0);

  @override
  void increment() {
    emit(state + 1);
    _debug();
  }

  @override
  void decrement() {
    emit(state > 0 ? state - 1 : 0);
    _debug();
  }

  void _debug() {
    log('Counter: $state');
  }
}
