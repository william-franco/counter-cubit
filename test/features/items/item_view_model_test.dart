// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:counter_cubit/src/features/items/view_models/item_view_model.dart';

void main() {
  group('ItemsViewModel', () {
    late ItemsViewModel viewModel;

    setUp(() {
      viewModel = ItemsViewModelImpl();
    });

    test('initial state is empty list', () {
      expect(viewModel.state, []);
    });

    blocTest(
      'add item to list',
      build: () => viewModel,
      act: (ItemsViewModel viewModel) => viewModel.addItemToList(),
      expect: () => [
        [1]
      ],
    );

    blocTest(
      'remove item from list',
      build: () => viewModel
        ..addItemToList()
        ..addItemToList(),
      act: (ItemsViewModel viewModel) => viewModel.removeItemFromList(),
      expect: () => [
        [1]
      ],
    );

    blocTest(
      'remove all items from list',
      build: () => viewModel
        ..addItemToList()
        ..addItemToList(),
      act: (ItemsViewModel viewModel) => viewModel.removeAllItems(),
      expect: () => [[]],
    );
  });
}
