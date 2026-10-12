import 'package:go_router/go_router.dart';

import '../features/auth/controllers/auth_controller.dart';
import '../features/dashboard/pages/player_dashboard_page.dart';
import '../features/home/pages/logged_out_home_page.dart';
import '../features/in_construction/pages/in_construction_page.dart';

/// Configures GoRouter declarative routing and reactive auth redirect guards.
GoRouter createAppRouter(AuthController authController) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: authController,
    redirect: (context, state) {
      final isAuthenticated = authController.isAuthenticated;
      final isGoingToDashboard = state.matchedLocation == '/dashboard';

      if (isGoingToDashboard && !isAuthenticated) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => LoggedOutHomePage(),
      ),
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => PlayerDashboardPage(),
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
