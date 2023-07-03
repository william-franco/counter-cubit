// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

abstract base class ItemsViewModel extends Cubit<List<int>> {
  ItemsViewModel() : super([]);

  void addItemToList();
  void removeItemFromList();
  void removeAllItems();
}

base class ItemsViewModelImpl extends Cubit<List<int>>
    implements ItemsViewModel {
  ItemsViewModelImpl() : super([]);

  int _count = 0;

  @override
  void addItemToList() {
    state.add(_count + 1);
    emit([...state]);
    _debug();
  }

  @override
  void removeItemFromList() {
    _count > 0 ? _count - 1 : 0;
    state.isNotEmpty ? state.removeLast() : 0;
    emit([...state]);
    _debug();
  }

  @override
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
