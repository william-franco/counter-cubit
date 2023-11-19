// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/features/items/models/item_model.dart';

abstract base class ItemsViewModel extends Cubit<ItemsModel> {
  ItemsViewModel() : super(ItemsModel());

  void addItemToList();
  void removeItemFromList();
  void removeAllItems();
}

base class ItemsViewModelImpl extends Cubit<ItemsModel>
    implements ItemsViewModel {
  ItemsViewModelImpl() : super(ItemsModel());

  @override
  void addItemToList() {
    state.items.add(state.count++);
    emit(state);
    _debug();
  }

  @override
  void removeItemFromList() {
    state.count > 0 ? state.count - 1 : 0;
    state.items.isNotEmpty ? state.items.removeLast() : 0;
    emit(state);
    _debug();
  }

  @override
  void removeAllItems() {
    state.count = 0;
    state.items.clear();
    emit(state);
    _debug();
  }

  void _debug() {
    log('List item: ${state.items.length}');
  }
}
