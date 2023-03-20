import 'package:counter_cubit/src/dependency_injector/dependency_injector.dart';
import 'package:counter_cubit/src/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:counter_cubit/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const DependencyInjector(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Counter Cubit',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(
            useMaterial3: true,
          ),
          themeMode: context.watch<ThemeCubit>().theme,
          routerConfig: routesApp.routes,
        );
      },
    );
  }
}
