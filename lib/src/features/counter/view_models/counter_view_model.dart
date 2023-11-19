// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/features/counter/models/counter_model.dart';

abstract base class CounterViewModel extends Cubit<CounterModel> {
  CounterViewModel() : super(CounterModel());

  void increment();
  void decrement();
}

base class CounterViewModelImpl extends Cubit<CounterModel>
    implements CounterViewModel {
  CounterViewModelImpl() : super(CounterModel());

  @override
  void increment() {
    state.count++;
    emit(state);
    _debug();
  }

  @override
  void decrement() {
    state.count--;
    emit(state);
    _debug();
  }

  void _debug() {
    log('Counter: ${state.count}');
  }
}
