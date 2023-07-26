// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:counter_cubit/src/features/counter/view_models/counter_view_model.dart';

void main() {
  group('CounterViewModel', () {
    late CounterViewModel viewModel;

    setUp(() {
      viewModel = CounterViewModelImpl();
    });

    blocTest(
      'initial state is []',
      build: () => viewModel,
      expect: () => <int>[],
    );

    blocTest(
      'emits [1] when increment is called',
      build: () => viewModel,
      act: (viewModel) => viewModel.increment(),
      expect: () => <int>[1],
    );

    blocTest(
      'emits [41] when increment is called',
      build: () => viewModel,
      seed: () => 40,
      act: (viewModel) => viewModel.increment(),
      expect: () => <int>[41],
    );

    blocTest(
      'emits [60] when decrement is called',
      build: () => viewModel,
      seed: () => 61,
      act: (viewModel) => viewModel.decrement(),
      expect: () => <int>[60],
    );

    blocTest(
      'emits [0] when decrement is called',
      build: () => viewModel,
      seed: () => 1,
      act: (viewModel) => viewModel.decrement(),
      expect: () => <int>[0],
    );

    blocTest(
      'cannot decrement below zero',
      build: () => viewModel,
      act: (viewModel) => viewModel.decrement(),
      expect: () => <int>[0],
    );
  });
}
