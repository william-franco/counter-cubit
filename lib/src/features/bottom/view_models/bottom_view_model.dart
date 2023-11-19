// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/features/bottom/models/bottom_model.dart';

abstract base class BottomViewModel extends Cubit<BottomModel> {
  BottomViewModel() : super(BottomModel());

  void changeIndexBottom({required int index});
}

base class BottomViewModelImpl extends Cubit<BottomModel>
    implements BottomViewModel {
  BottomViewModelImpl() : super(BottomModel());

  @override
  void changeIndexBottom({required int index}) {
    state.indexTab = index;
    emit(state);
    _debug();
  }

  void _debug() {
    log('Current tab: ${state.indexTab}');
  }
}
