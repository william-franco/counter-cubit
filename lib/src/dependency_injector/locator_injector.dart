// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:counter_cubit/src/features/settings/repositories/setting_repository.dart';
import 'package:counter_cubit/src/services/storage_service.dart';

final locator = GetIt.instance;

void locatorInjector() {
  startModuleSettings();
}

void startModuleSettings() {
  // Services
  locator.registerFactory<StorageService>(
    () => StorageServiceImpl(),
  );
  // Repositories
  locator.registerFactory<SettingRepository>(
    () => SettingRepositoryImpl(
      storageService: locator<StorageService>(),
    ),
  );
}
