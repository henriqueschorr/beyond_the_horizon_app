import 'package:go_router/go_router.dart';

import '../features/auth/controllers/auth_controller.dart';
import '../features/landing/pages/landing_page.dart';
import '../features/home/pages/home_page.dart';
import '../features/in_construction/pages/in_construction_page.dart';
import '../shared_widgets/shell/terminal_portal_shell.dart';

/// Configures GoRouter declarative routing and reactive auth redirect guards.
GoRouter createAppRouter(AuthController authController) {
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
      ShellRoute(
        builder: (context, state, child) {
          return TerminalPortalShell(
            currentLocation: state.matchedLocation,
            authController: authController,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'landing',
            builder: (context, state) => LandingPage(authController: authController),
          ),
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => HomePage(authController: authController),
          ),
        ],
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
