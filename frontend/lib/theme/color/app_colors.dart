import 'package:flutter/material.dart';

/// Canonical color tokens for Beyond the Horizon App, matching SDD 04 Section 3.
abstract final class AppColors {
  // Universal Interactive Accent Token
  static const Color accentOrange = Color(0xFFFE6403); // Cassette 90 Vibrant Orange (Dark)
  static const Color accentOrangeLight = Color(0xFFC2410C); // High-contrast Burnt Tape Orange (Light)

  // Dark Mode Base Surfaces
  static const Color darkBgCanvas = Color(0xFF101214); // Deep cosmic void canvas
  static const Color darkBgSurface = Color(0xFF16191D); // Chassis surface, panels, utility buttons
  static const Color darkBgSurfaceElevated = Color(0xFF20252C); // Elevated button chassis, popovers
  static const Color darkBgWell = Color(0xFF0C0E10); // Recessed input wells, terminal insets

  // Dark Mode Borders & Seams
  static const Color darkBorderSubtle = Color(0xFF282E36); // 1px hairline perimeter seams
  static const Color darkBorderProminent = Color(0xFF444D5A); // Prominent framing, active button rims

  // Dark Mode Typography (Titanium Hierarchy)
  static const Color darkTextPrimary = Color(0xFFF0ECE1); // High-contrast titanium white
  static const Color darkTextSecondary = Color(0xFFC8C4B8); // Reading body copy (~85% luminance)
  static const Color darkTextMuted = Color(0xFF7B8491); // Muted telemetry metadata, placeholders

  // Light Mode Base Surfaces
  static const Color lightBgCanvas = Color(0xFFF5F3ED); // Warm bone-titanium field canvas
  static const Color lightBgSurface = Color(0xFFFFFFFF); // Crisp ceramic surface
  static const Color lightBgSurfaceElevated = Color(0xFFFAF8F5); // Elevated surface for popovers
  static const Color lightBgWell = Color(0xFFEAE5DA); // Recessed bays, terminal search insets

  // Light Mode Borders & Seams
  static const Color lightBorderSubtle = Color(0xFFDCD6C8); // Machined 1px hairline structural seams
  static const Color lightBorderProminent = Color(0xFFB5AC9B); // Anodized chassis framing

  // Light Mode Typography
  static const Color lightTextPrimary = Color(0xFF121518); // Deep obsidian carbon primary text
  static const Color lightTextSecondary = Color(0xFF454C55); // Slate carbon secondary prose
  static const Color lightTextMuted = Color(0xFF6C7480); // Calibrated graphite telemetry metadata
}
