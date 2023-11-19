// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/features/settings/view_models/setting_view_model.dart';

class ThemeListTileWidget extends StatelessWidget {
  const ThemeListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    return ListTile(
      leading: const Icon(Icons.brightness_6_outlined),
      title: const Text('Dark Theme'),
      trailing: Switch(
        value: viewModel.state.isDarkTheme,
        onChanged: (bool enabled) {
          context.read<SettingViewModel>().changeTheme(isDarkTheme: enabled);
        },
      ),
    );
  }
}
