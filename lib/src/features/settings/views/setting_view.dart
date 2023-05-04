// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/features/settings/view_models/setting_cubit.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<SettingViewModel>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
