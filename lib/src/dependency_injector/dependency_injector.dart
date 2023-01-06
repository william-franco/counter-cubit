import 'package:counter_cubit/src/features/bottom/presentation/cubit/bottom_cubit.dart';
import 'package:counter_cubit/src/features/counter/presentation/cubit/counter_cubit.dart';
import 'package:counter_cubit/src/features/items/presentation/cubit/item_cubit.dart';
import 'package:counter_cubit/src/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;
  final SharedPreferences prefs;

  const DependencyInjector({
    super.key,
    required this.child,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ItemsCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(prefs),
        ),
      ],
      child: child,
    );
  }
}
