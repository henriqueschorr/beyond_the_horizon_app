import 'package:backend/backend.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/controllers/auth_controller.dart';
import '../features/auth/validators/auth_validator.dart';
import '../features/settings/controllers/settings_controller.dart';
import '../services/user_local_storage_service.dart';

/// Global GetIt service locator instance for the frontend client.
final GetIt serviceLocator = GetIt.instance;

/// Sets up frontend and in-process backend dependency injection.
void setupFrontendServiceLocator({GetIt? locator}) {
  final currentLocator = locator ?? serviceLocator;

  // Initialize in-process backend container first
  setupBackendServiceLocator(locator: currentLocator);

  // Local Storage Service
  if (!currentLocator.isRegistered<UserLocalStorageService>()) {
    currentLocator.registerLazySingleton<UserLocalStorageService>(() => UserLocalStorageService());
  }

  // Validators
  if (!currentLocator.isRegistered<AuthValidator>()) {
    currentLocator.registerLazySingleton<AuthValidator>(() => const AuthValidator());
  }

  // Feature Controllers
  if (!currentLocator.isRegistered<AuthController>()) {
    currentLocator.registerLazySingleton<AuthController>(
      () => AuthController(
        backendService: currentLocator<BackendService>(),
        validator: currentLocator<AuthValidator>(),
      ),
    );
  }

  if (!currentLocator.isRegistered<SettingsController>()) {
    currentLocator.registerLazySingleton<SettingsController>(
      () => SettingsController(storage: currentLocator<UserLocalStorageService>()),
    );
  }
}
