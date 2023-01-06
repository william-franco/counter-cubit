import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);
    _debug();
  }

  void decrement() {
    emit(state - 1);
    _debug();
  }

  void _debug() {
    log('Counter: $state');
  }
}
