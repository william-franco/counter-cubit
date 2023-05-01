import 'package:counter_cubit/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:counter_cubit/src/features/counter/view_models/counter_view_model.dart';
import 'package:counter_cubit/src/features/items/view_models/item_view_model.dart';
import 'package:counter_cubit/src/features/settings/repositories/setting_repository.dart';
import 'package:counter_cubit/src/features/settings/view_models/setting_cubit.dart';
import 'package:counter_cubit/src/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // Services
        RepositoryProvider(
          create: (context) => StorageService(),
        ),
        // Repositories
        RepositoryProvider(
          create: (context) => SettingRepository(
            storageService: context.read<StorageService>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // ViewModels
          BlocProvider(
            create: (context) => BottomViewModel(),
          ),
          BlocProvider(
            create: (context) => CounterViewModel(),
          ),
          BlocProvider(
            create: (context) => ItemsViewModel(),
          ),
          BlocProvider(
            create: (context) => SettingViewModel(
              settingRepository: context.read<SettingRepository>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
