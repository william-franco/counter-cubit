// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:counter_cubit/src/features/counter/view_models/counter_view_model.dart';

void main() {
  group('CounterViewModel', () {
    late CounterViewModel viewModel;

    setUp(() {
      viewModel = CounterViewModelImpl();
    });

    test('initial value is 0', () {
      expect(viewModel.state.count, equals(0));
    });

    test('value should be 1 when increment is called', () {
      viewModel.increment();
      expect(viewModel.state.count, equals(1));
    });

    test('value should be 41 when increment is called', () {
      viewModel.state.count = 40;
      viewModel.increment();
      expect(viewModel.state.count, equals(41));
    });

    test('value should be 60 when decrement is called', () {
      viewModel.state.count = 61;
      viewModel.decrement();
      expect(viewModel.state.count, equals(60));
    });

    test('value should be 0 when decrement is called', () {
      viewModel.state.count = 1;
      viewModel.decrement();
      expect(viewModel.state.count, equals(0));
    });

    test('cannot decrement below zero', () {
      viewModel.decrement();
      expect(viewModel.state.count, equals(-1));
    });
  });
}
