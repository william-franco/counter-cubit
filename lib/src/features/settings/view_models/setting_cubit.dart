// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/features/settings/repositories/setting_repository.dart';

abstract base class SettingViewModel extends Cubit<bool> {
  SettingViewModel() : super(false);

  Future<void> loadTheme();
  Future<void> changeTheme({required bool isDarkMode});
}

base class SettingViewModelImpl extends Cubit<bool>
    implements SettingViewModel {
  final SettingRepository settingRepository;

  SettingViewModelImpl({required this.settingRepository}) : super(false) {
    loadTheme();
  }

  @override
  Future<void> loadTheme() async {
    final isDarkMode = await settingRepository.readTheme();
    emit(isDarkMode);
    _debug();
  }

  @override
  Future<void> changeTheme({required bool isDarkMode}) async {
    await settingRepository.updateTheme(isDarkTheme: isDarkMode);
    emit(isDarkMode);
    _debug();
  }

  void _debug() {
    log('Dark theme: $state');
  }
}
