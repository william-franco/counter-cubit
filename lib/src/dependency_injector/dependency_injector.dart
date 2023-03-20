import 'package:counter_cubit/src/features/bottom/presentation/cubit/bottom_cubit.dart';
import 'package:counter_cubit/src/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:counter_cubit/src/features/items/presentation/cubit/item_cubit.dart';
import 'package:counter_cubit/src/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:counter_cubit/src/storage/storage_service.dart';
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
    final service = StorageService();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ItemsCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(service),
        ),
      ],
      child: child,
    );
  }
}
