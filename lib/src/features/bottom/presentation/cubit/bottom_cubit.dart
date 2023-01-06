import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class BottomCubit extends Cubit<int> {
  BottomCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
    _debug();
  }

  void _debug() {
    log('Current tab: $state');
  }
}
