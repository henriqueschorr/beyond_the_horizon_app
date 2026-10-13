import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

import '../../core/service_locator.dart';
import '../../features/auth/controllers/auth_controller.dart';
import '../../features/settings/controllers/settings_controller.dart';
import '../../features/settings/widgets/terminal_settings_drawer.dart';
import '../../theme/color/app_colors.dart';
import '../../theme/shaders/crt_surface.dart';
import '../../theme/shaders/star_surface.dart';
import '../layout/responsive_telemetry_guard.dart';
import '../portal/crossword_brand_mark.dart';
import '../portal/event_horizon_arc.dart';

/// Persistent atmospheric terminal portal shell specified in SDD 04.
/// Wraps GoRouter ShellRoute children with continuous hardware-accelerated spatial continuity,
/// moving the brand mark and black hole halo while cross-fading landing and home feature slots.
class TerminalPortalShell extends StatefulWidget {
  final Widget child;
  final String currentLocation;
  final AuthController authController;
  final SettingsController settingsController;

  TerminalPortalShell({
    super.key,
    required this.child,
    required this.currentLocation,
    AuthController? authController,
    SettingsController? settingsController,
  })  : authController = authController ?? serviceLocator<AuthController>(),
        settingsController = settingsController ?? serviceLocator<SettingsController>();

  @override
  State<TerminalPortalShell> createState() => _TerminalPortalShellState();
}

class _TerminalPortalShellState extends State<TerminalPortalShell>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final AnimationController _transitionController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    final bool isInitiallyAuthenticated =
        widget.authController.isAuthenticated || widget.currentLocation == '/home';

    _transitionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
      value: isInitiallyAuthenticated ? 1.0 : 0.0,
    );

    _animation = CurvedAnimation(
      parent: _transitionController,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void didUpdateWidget(covariant TerminalPortalShell oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentLocation != widget.currentLocation) {
      final bool isTargetingHome =
          widget.currentLocation == '/home' || widget.authController.isAuthenticated;

      if (isTargetingHome && _transitionController.value < 1.0) {
        _transitionController.forward();
      } else if (!isTargetingHome && _transitionController.value > 0.0) {
        _transitionController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _transitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveTelemetryGuard(
      child: ListenableBuilder(
        listenable: widget.settingsController,
        builder: (context, _) {
          return Scaffold(
            key: _scaffoldKey,
            backgroundColor: AppColors.darkBgCanvas,
            endDrawer: TerminalSettingsDrawer(settingsController: widget.settingsController),
            body: CrtSurface(
              enabled: widget.settingsController.isCrtEnabled,
              child: StarSurface(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, _) {
                    final double progress = _animation.value;

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final double width = constraints.maxWidth;
                        final double height = constraints.maxHeight;

                        const double cellSize = 76.0;
                        const double contentHeight = 658.0;
                        final double centeredTop = (height - contentHeight) / 2;
                        final double topPadding = math.max(24.0, centeredTop - cellSize);

                        final double apexY = topPadding + (4 * cellSize);
                        final double brandMarkTop = topPadding + 8.0;

                        const double brandMarkWidth = 532.0;
                        final double centeredBrandX = (width - brandMarkWidth) / 2;
                        const double dockedBrandX = 40.0;
                        final double brandMarkLeft =
                            lerpDouble(centeredBrandX, dockedBrandX, progress)!;

                        final double slideDistance = centeredBrandX - dockedBrandX;

                        // Apex starts at screen center and slides by slideDistance in lockstep with the brand mark
                        final double currentApexX = (width / 2.0) - (progress * slideDistance);

                        final bool isHome = widget.currentLocation == '/home';

                        return Stack(
                          children: [
                            // LAYER 1: Parabolic Event Horizon Arc (full viewport, exact curve form, continues to bottom)
                            Positioned.fill(
                              child: EventHorizonArc(
                                apexX: currentApexX,
                                apexY: apexY,
                              ),
                            ),

                            // LAYER 2: Monumental Crossword Brand Mark (gliding left on auth)
                            Positioned(
                              left: brandMarkLeft,
                              top: brandMarkTop,
                              child: const CrosswordBrandMark(
                                scale: 1.0,
                                showSubmergedLetters: true,
                              ),
                            ),

                            // LAYER 3: Landing Access Slot (mounted strictly when logged out at /)
                            if (!isHome)
                              Positioned(
                                left: 0,
                                right: 0,
                                top: brandMarkTop + 456.0 + 108.0,
                                child: Opacity(
                                  opacity: ((1.0 - progress - 0.15) / 0.85).clamp(0.0, 1.0),
                                  child: Transform.translate(
                                    offset: Offset(0, 16.0 * progress),
                                    child: IgnorePointer(
                                      ignoring: progress > 0.05,
                                      child: widget.child,
                                    ),
                                  ),
                                ),
                              ),

                            // LAYER 4: Authenticated Home Slot (mounted strictly when logged in at /home)
                            if (isHome)
                              Positioned(
                                right: width > 768 ? 140.0 : 20.0,
                                top: brandMarkTop + 16.0,
                                width: math.min(380.0, width - 40.0),
                                bottom: 40.0,
                                child: Opacity(
                                  opacity: ((progress - 0.20) / 0.80).clamp(0.0, 1.0),
                                  child: Transform.translate(
                                    offset: Offset(24.0 * (1.0 - progress), 0),
                                    child: IgnorePointer(
                                      ignoring: progress < 0.95,
                                      child: widget.child,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
