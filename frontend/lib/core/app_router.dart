import 'package:go_router/go_router.dart';

import 'service_locator.dart';
import '../features/auth/controllers/auth_controller.dart';
import '../features/settings/controllers/settings_controller.dart';
import '../features/landing/pages/landing_page.dart';
import '../features/home/pages/home_page.dart';
import '../features/in_construction/pages/in_construction_page.dart';

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
      final isProtected = state.matchedLocation == '/home' || state.matchedLocation == '/dashboard';

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
        builder: (context, state) => HomePage(
          authController: authController,
          settingsController: resolvedSettingsController,
        ),
      ),
      GoRoute(
        path: '/in-construction',
        name: 'in-construction',
        builder: (context, state) {
          final module = state.uri.queryParameters['module'];
          return InConstructionPage(moduleName: module);
        },
      ),
    ],
  );
}
