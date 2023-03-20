import 'package:counter_cubit/src/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:counter_cubit/src/widgets/molecules/app_bar_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMolecule(
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, state) {
                return RadioListTile<ThemeMode>(
                  title: const Text('Light Mode'),
                  groupValue: state,
                  value: ThemeMode.light,
                  onChanged: (value) {
                    context.read<ThemeCubit>().updateThemeMode(value);
                  },
                );
              },
            ),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, state) {
                return RadioListTile<ThemeMode>(
                  title: const Text('Dark Mode'),
                  groupValue: state,
                  value: ThemeMode.dark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().updateThemeMode(value);
                  },
                );
              },
            ),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, state) {
                return RadioListTile<ThemeMode>(
                  title: const Text('System Mode'),
                  groupValue: state,
                  value: ThemeMode.system,
                  onChanged: (value) {
                    context.read<ThemeCubit>().updateThemeMode(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
