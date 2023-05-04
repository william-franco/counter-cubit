// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:counter_cubit/src/features/counter/views/counter_view.dart';
import 'package:counter_cubit/src/features/items/views/item_view.dart';
import 'package:counter_cubit/src/features/settings/views/setting_view.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  final listOfWidgets = [
    const CounterView(),
    const ItemsView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<BottomViewModel>().state;
    return Scaffold(
      body: listOfWidgets.elementAt(state),
      bottomNavigationBar: NavigationBar(
        selectedIndex: state,
        animationDuration: const Duration(milliseconds: 600),
        onDestinationSelected: (int index) {
          context.read<BottomViewModel>().changeIndexBottom(index);
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.add_outlined),
            label: 'Counter',
          ),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            label: 'List',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
