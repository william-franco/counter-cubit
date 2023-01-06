import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsCubit extends Cubit<List<int>> {
  ItemsCubit() : super([]);

  int _count = 0;

  void addItemToList() {
    state.add(_count++);
    emit(state);
    _debugProvider();
  }

  void removeItemFromList() {
    _count > 0 ? _count-- : 0;
    state.isNotEmpty ? state.removeLast() : 0;
    emit(state);
    _debugProvider();
  }

  void removeAllItems() {
    _count = 0;
    state.clear();
    emit(state);
    _debugProvider();
  }

  void _debugProvider() {
    log('List item: ${state.length}');
  }
}
