import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsCubit extends Cubit<List<int>> {
  ItemsCubit() : super([]);

  int _count = 0;

  void addItemToList() {
    state.add(_count + 1);
    emit([...state]);
    _debugCubit();
  }

  void removeItemFromList() {
    _count > 0 ? _count - 1 : 0;
    state.isNotEmpty ? state.removeLast() : 0;
    emit([...state]);
    _debugCubit();
  }

  void removeAllItems() {
    _count = 0;
    state.clear();
    emit([...state]);
    _debugCubit();
  }

  void _debugCubit() {
    log('List item: ${state.length}');
  }
}
