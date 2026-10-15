import 'package:go_router/go_router.dart';

import 'service_locator.dart';
import '../features/auth/controllers/auth_controller.dart';
import '../features/blank/pages/blank_page.dart';
import '../features/home/player/pages/player_home_page.dart';
import '../features/landing/pages/landing_page.dart';
import '../features/settings/controllers/settings_controller.dart';

/// Configures GoRouter declarative routing and reactive auth redirect guards.
GoRouter createAppRouter(
  AuthController authController, [
  SettingsController? settingsController,
]) {
  final resolvedSettingsController =
      settingsController ?? serviceLocator<SettingsController>();

  return GoRouter(
    initialLocation: '/',
    refreshListenable: authController,
    redirect: (context, state) {
      final isAuthenticated = authController.isAuthenticated;
      final isProtected = state.matchedLocation == '/home' ||
          state.matchedLocation == '/dashboard' ||
          state.matchedLocation == '/blank';

      if (isProtected && !isAuthenticated) {
        return '/';
      }
      if (state.matchedLocation == '/dashboard') {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'landing',
        builder: (context, state) => LandingPage(
          authController: authController,
          settingsController: resolvedSettingsController,
        ),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => PlayerHomePage(
          authController: authController,
          settingsController: resolvedSettingsController,
        ),
      ),
      GoRoute(
        path: '/blank',
        name: 'blank',
        builder: (context, state) => const BlankPage(),
      ),
    ],
  );
}
