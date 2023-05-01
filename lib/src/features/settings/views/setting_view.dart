import 'package:counter_cubit/src/features/settings/view_models/setting_cubit.dart';
import 'package:counter_cubit/src/widgets/molecules/app_bar_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<SettingViewModel>().state;
    return Scaffold(
      appBar: const AppBarMolecule(
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.brightness_6_outlined),
              title: const Text('Dark theme'),
              trailing: Switch(
                value: isDarkTheme,
                onChanged: (bool enabled) {
                  context.read<SettingViewModel>().changeTheme(enabled);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
