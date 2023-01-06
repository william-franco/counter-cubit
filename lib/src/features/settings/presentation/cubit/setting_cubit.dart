import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit(this.prefs) : super(prefs?.getBool('theme') ?? false);

  final SharedPreferences? prefs;

  void changeTheme(bool value) {
    prefs!.setBool('theme', value);
    emit(value);
    log('Dark theme: $value');
  }
}
