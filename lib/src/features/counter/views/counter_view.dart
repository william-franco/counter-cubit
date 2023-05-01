import 'package:counter_cubit/src/features/counter/view_models/counter_view_model.dart';
import 'package:counter_cubit/src/widgets/molecules/app_bar_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CounterViewModel>().state;
    return Scaffold(
      appBar: const AppBarMolecule(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$state',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('increment'),
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterViewModel>().increment();
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('decrement'),
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterViewModel>().decrement();
            },
          ),
        ],
      ),
    );
  }
}
