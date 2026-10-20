import 'package:get_it/get_it.dart';

import '../backend_service.dart';
import '../repositories/auth_repository.dart';
import '../repositories/lore_epigraph_repository.dart';
import '../repositories/mock/mock_auth_repository.dart';
import '../repositories/mock/mock_lore_epigraph_repository.dart';
import '../repositories/mock/mock_profile_repository.dart';
import '../repositories/profile_repository.dart';
import '../services/auth_service.dart';
import '../services/lore_epigraph_service.dart';
import '../services/profile_service.dart';

/// Global GetIt service locator instance for backend domain services and repositories.
final GetIt serviceLocator = GetIt.instance;

/// Registers backend repositories and domain services in the GetIt service locator.
void setupBackendServiceLocator({GetIt? locator}) {
  final currentLocator = locator ?? serviceLocator;

  // Repositories
  if (!currentLocator.isRegistered<MockProfileRepository>()) {
    final mockProfileRepo = MockProfileRepository();
    currentLocator.registerSingleton<MockProfileRepository>(mockProfileRepo);
    currentLocator.registerSingleton<ProfileRepository>(mockProfileRepo);
  }

  if (!currentLocator.isRegistered<MockAuthRepository>()) {
    final mockAuthRepo = MockAuthRepository(
      profileRepository: currentLocator<MockProfileRepository>(),
    );
    currentLocator.registerSingleton<MockAuthRepository>(mockAuthRepo);
    currentLocator.registerSingleton<AuthRepository>(mockAuthRepo);
  }

  if (!currentLocator.isRegistered<MockLoreEpigraphRepository>()) {
    final mockLoreEpigraphRepo = MockLoreEpigraphRepository();
    currentLocator.registerSingleton<MockLoreEpigraphRepository>(mockLoreEpigraphRepo);
    currentLocator.registerSingleton<LoreEpigraphRepository>(mockLoreEpigraphRepo);
  }

  // Domain Services
  if (!currentLocator.isRegistered<ProfileService>()) {
    currentLocator.registerLazySingleton<ProfileService>(
      () => ProfileService(profileRepository: currentLocator<ProfileRepository>()),
    );
  }

  if (!currentLocator.isRegistered<AuthService>()) {
    currentLocator.registerLazySingleton<AuthService>(
      () => AuthService(
        authRepository: currentLocator<AuthRepository>(),
        profileRepository: currentLocator<ProfileRepository>(),
      ),
    );
  }

  if (!currentLocator.isRegistered<LoreEpigraphService>()) {
    currentLocator.registerLazySingleton<LoreEpigraphService>(
      () => LoreEpigraphService(
        loreEpigraphRepository: currentLocator<LoreEpigraphRepository>(),
      ),
    );
  }

  // Unified Facade
  if (!currentLocator.isRegistered<BackendService>()) {
    currentLocator.registerLazySingleton<BackendService>(
      () => BackendService(
        auth: currentLocator<AuthService>(),
        profile: currentLocator<ProfileService>(),
        loreEpigraph: currentLocator<LoreEpigraphService>(),
      ),
    );
  }
}

