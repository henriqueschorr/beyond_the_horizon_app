import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'core/service_locator.dart';
import 'core/app_router.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'features/settings/controllers/settings_controller.dart';
import 'l10n/app_localizations.dart';
import 'theme/color/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  setupFrontendServiceLocator();

  final authController = serviceLocator<AuthController>();
  final settingsController = serviceLocator<SettingsController>();
  final router = createAppRouter(authController);

  runApp(
    BeyondTheHorizonApp(
      router: router,
      settingsController: settingsController,
    ),
  );
}

class BeyondTheHorizonApp extends StatelessWidget {
  final dynamic router;
  final SettingsController settingsController;

  const BeyondTheHorizonApp({
    super.key,
    required this.router,
    required this.settingsController,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (context, _) {
        return MaterialApp.router(
          title: 'Beyond the Horizon',
          debugShowCheckedModeBanner: false,
          themeMode: settingsController.themeMode,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColors.lightBgCanvas,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.accentOrangeLight,
              brightness: Brightness.light,
              surface: AppColors.lightBgSurface,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.darkBgCanvas,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.accentOrange,
              brightness: Brightness.dark,
              surface: AppColors.darkBgSurface,
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('pt', 'BR'),
          routerConfig: router,
        );
      },
    );
  }
}
