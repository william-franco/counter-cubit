// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/dependency_injector/dependency_injector.dart';
import 'package:counter_cubit/src/features/settings/view_models/setting_cubit.dart';
import 'package:counter_cubit/src/routes/routes.dart';

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
    final isDarkTheme = context.watch<SettingViewModel>().state;
    return MaterialApp.router(
      title: 'Counter Cubit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      routerConfig: routesApp.routes,
    );
  }
}
