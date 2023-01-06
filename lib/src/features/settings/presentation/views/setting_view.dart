import 'package:counter_cubit/src/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:counter_cubit/src/widgets/molecules/app_bar_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMolecule(
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            BlocBuilder<ThemeCubit, bool>(
              builder: (context, state) {
                return ListTile(
                  leading: const Icon(Icons.brightness_6_outlined),
                  title: const Text('Dark theme'),
                  trailing: Switch(
                    value: state,
                    onChanged: (enabled) {
                      context.read<ThemeCubit>().changeTheme(enabled);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
