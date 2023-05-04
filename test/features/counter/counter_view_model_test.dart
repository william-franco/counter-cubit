// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:counter_cubit/src/features/counter/view_models/counter_view_model.dart';

void main() {
  group('CounterViewModel', () {
    late CounterViewModel viewModel;

    setUp(() {
      viewModel = CounterViewModel();
    });

    test('initial state is 0', () {
      expect(viewModel.state, 0);
    });

    blocTest(
      'increment',
      build: () => viewModel,
      act: (CounterViewModel viewModel) => viewModel.increment(),
      expect: () => [
        1,
      ],
    );

    blocTest(
      'decrement',
      build: () => viewModel..increment(),
      act: (CounterViewModel viewModel) => viewModel.decrement(),
      expect: () => [
        0,
      ],
    );

    blocTest(
      'cannot decrement below zero',
      build: () => viewModel,
      act: (CounterViewModel viewModel) => viewModel.decrement(),
      expect: () => [
        0,
      ],
    );
  });
}
