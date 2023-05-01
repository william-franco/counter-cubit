import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsViewModel extends Cubit<List<int>> {
  ItemsViewModel() : super([]);

  int _count = 0;

  void addItemToList() {
    state.add(_count + 1);
    emit([...state]);
    _debug();
  }

  void removeItemFromList() {
    _count > 0 ? _count - 1 : 0;
    state.isNotEmpty ? state.removeLast() : 0;
    emit([...state]);
    _debug();
  }

  void removeAllItems() {
    _count = 0;
    state.clear();
    emit([...state]);
    _debug();
  }

  void _debug() {
    log('List item: ${state.length}');
  }
}
