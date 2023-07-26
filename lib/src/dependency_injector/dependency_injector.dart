// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/dependency_injector/locator_injector.dart';
import 'package:counter_cubit/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:counter_cubit/src/features/counter/view_models/counter_view_model.dart';
import 'package:counter_cubit/src/features/items/view_models/item_view_model.dart';
import 'package:counter_cubit/src/features/settings/repositories/setting_repository.dart';
import 'package:counter_cubit/src/features/settings/view_models/setting_cubit.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ViewModels
        BlocProvider<BottomViewModel>(
          create: (context) => BottomViewModelImpl(),
        ),
        BlocProvider<CounterViewModel>(
          create: (context) => CounterViewModelImpl(),
        ),
        BlocProvider<ItemsViewModel>(
          create: (context) => ItemsViewModelImpl(),
        ),
        BlocProvider<SettingViewModel>(
          create: (context) => SettingViewModelImpl(
            settingRepository: locator<SettingRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
