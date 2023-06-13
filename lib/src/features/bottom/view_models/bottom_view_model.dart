// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

abstract base class BottomViewModel extends Cubit<int> {
  BottomViewModel() : super(0);

  void changeIndexBottom(int index);
}

base class BottomViewModelImpl extends Cubit<int> implements BottomViewModel {
  BottomViewModelImpl() : super(0);

  @override
  void changeIndexBottom(int index) {
    emit(index);
    _debug();
  }

  void _debug() {
    log('Current tab: $state');
  }
}
