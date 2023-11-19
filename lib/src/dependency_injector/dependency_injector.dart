// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/features/bottom/view_models/bottom_view_model.dart';
import 'package:counter_cubit/src/features/counter/view_models/counter_view_model.dart';
import 'package:counter_cubit/src/features/items/view_models/item_view_model.dart';
import 'package:counter_cubit/src/features/settings/repositories/setting_repository.dart';
import 'package:counter_cubit/src/features/settings/view_models/setting_view_model.dart';
import 'package:counter_cubit/src/services/storage_service.dart';

class DependencyInjector extends StatefulWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  State<DependencyInjector> createState() => _DependencyInjectorState();
}

class _DependencyInjectorState extends State<DependencyInjector> {
  late StorageService storageService;
  late SettingRepository settingRepository;

  @override
  void initState() {
    super.initState();
    storageService = StorageServiceImpl();
    settingRepository = SettingRepositoryImpl(storageService: storageService);
  }

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
            settingRepository: settingRepository,
          ),
        ),
      ],
      child: widget.child,
    );
  }
}
