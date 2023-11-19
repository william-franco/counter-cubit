// Dart imports:
import 'dart:developer';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:counter_cubit/src/features/settings/models/setting_model.dart';
import 'package:counter_cubit/src/features/settings/repositories/setting_repository.dart';

abstract base class SettingViewModel extends Cubit<SettingModel> {
  SettingViewModel() : super(SettingModel());

  Future<void> loadTheme();
  Future<void> changeTheme({required bool isDarkTheme});
}

base class SettingViewModelImpl extends Cubit<SettingModel>
    implements SettingViewModel {
  final SettingRepository settingRepository;

  SettingViewModelImpl({
    required this.settingRepository,
  }) : super(SettingModel()) {
    loadTheme();
  }

  @override
  Future<void> loadTheme() async {
    state.isDarkTheme = await settingRepository.readTheme();
    emit(state);
    _debug();
  }

  @override
  Future<void> changeTheme({required bool isDarkTheme}) async {
    state.isDarkTheme = isDarkTheme;
    await settingRepository.updateTheme(isDarkTheme: isDarkTheme);
    emit(state);
    _debug();
  }

  void _debug() {
    log('Dark theme: ${state.isDarkTheme}');
  }
}
