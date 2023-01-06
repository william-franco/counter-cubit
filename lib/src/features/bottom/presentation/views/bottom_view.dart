import 'package:counter_cubit/src/features/bottom/presentation/cubit/bottom_cubit.dart';
import 'package:counter_cubit/src/features/counter/presentation/views/counter_view.dart';
import 'package:counter_cubit/src/features/items/presentation/views/item_view.dart';
import 'package:counter_cubit/src/features/settings/presentation/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  final tabs = [
    const CounterView(),
    const ItemsView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: tabs.elementAt(state),
          bottomNavigationBar: NavigationBar(
            selectedIndex: state,
            animationDuration: const Duration(milliseconds: 600),
            onDestinationSelected: (int index) {
              context.read<BottomCubit>().updateIndex(index);
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
      },
    );
  }
}
