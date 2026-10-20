import 'package:flutter/material.dart';

import '../../../shared_widgets/layout/vertical_seam_divider.dart';
import '../../auth/controllers/auth_controller.dart';
import 'logged_out_menu.dart';
import 'login_form.dart';

/// Standalone Logged-Out Access Console widget adhering strictly to Rule 8 of Agents.md.
/// Composes LoginForm and LoggedOutMenu separated by the central vertical seam gradient line.
class LoggedOutAccessConsole extends StatelessWidget {
  final AuthController authController;
  final VoidCallback onSignIn;
  final VoidCallback onOpenRegistration;
  final VoidCallback onOpenSettings;
  final VoidCallback? onOpenCodex;

  const LoggedOutAccessConsole({
    super.key,
    required this.authController,
    required this.onSignIn,
    required this.onOpenRegistration,
    required this.onOpenSettings,
    this.onOpenCodex,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.topCenter,
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Login Form (Left)
                LoginForm(
                  authController: authController,
                  onSignIn: onSignIn,
                  onOpenRegistration: onOpenRegistration,
                ),

                // Vertical Divider Seam Line (Center)
                const VerticalSeamDivider(),

                // Logged-Out Menu (Right: Codex & Settings)
                Center(
                  child: LoggedOutMenu(
                    onOpenSettings: onOpenSettings,
                    onOpenCodex: onOpenCodex,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
