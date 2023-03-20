import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  var theme = ThemeMode.light;

  StorageService() {
    getThemeMode();
  }

  Future<ThemeMode> getThemeMode() async {
    final storage = await SharedPreferences.getInstance();

    bool? darkMode = storage.getBool('darkMode');

    if (darkMode == null) {
      theme = ThemeMode.light;
      return theme;
    } else {
      theme = darkMode ? ThemeMode.dark : ThemeMode.light;
      return theme;
    }
  }

  Future<void> setThemeMode(ThemeMode theme) async {
    final storage = await SharedPreferences.getInstance();

    await storage.setBool(
      'darkMode',
      theme == ThemeMode.dark ? true : false,
    );
  }
}
