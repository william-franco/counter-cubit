import 'dart:developer';

import 'package:counter_cubit/src/storage/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._storage) : super(_storage.theme) {
    _loadTheme();
  }

  final StorageService _storage;

  ThemeMode theme = ThemeMode.light;

  Future<void> _loadTheme() async {
    theme = await _storage.getThemeMode();
    emit(theme);
    _debugCubit();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    if (newThemeMode == theme) return;

    theme = newThemeMode;

    await _storage.setThemeMode(newThemeMode);
    emit(theme);

    _debugCubit();
  }

  void _debugCubit() {
    log('Theme: $theme');
  }
}
