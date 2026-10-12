import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color/app_colors.dart';

/// Central typography styles defined in SDD 04 Section 4.2.
/// Features Space Grotesk, Space Mono, and Inter font families.
abstract final class AppTypography {
  static TextStyle get displayTitleLarge => GoogleFonts.spaceGrotesk(
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        height: 1.25,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get displayTitle => GoogleFonts.spaceGrotesk(
        fontSize: 26.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
        height: 1.15,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get sectionTitle => GoogleFonts.spaceGrotesk(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.1,
        height: 1.20,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get actionLabel => GoogleFonts.spaceGrotesk(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.10,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get navAnchor => GoogleFonts.spaceGrotesk(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        height: 1.20,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get tacticalLabel => GoogleFonts.spaceMono(
        fontSize: 13.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        height: 1.20,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get tacticalLabelHighlighted => GoogleFonts.spaceMono(
        fontSize: 13.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        height: 1.20,
        color: AppColors.accentOrange,
      );

  static TextStyle get tacticalLabelSmall => GoogleFonts.spaceMono(
        fontSize: 11.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get tacticalLabelSmallHighlighted => GoogleFonts.spaceMono(
        fontSize: 11.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.accentOrange,
      );

  static TextStyle get legend => GoogleFonts.spaceMono(
        fontSize: 11.5,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.25,
        color: AppColors.darkTextMuted,
      );

  static TextStyle get legendHighlighted => GoogleFonts.spaceMono(
        fontSize: 11.5,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.25,
        color: AppColors.accentOrange,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        height: 1.75,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        height: 1.70,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get bodyProse => GoogleFonts.inter(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        height: 1.60,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get bodyProseSmall => GoogleFonts.inter(
        fontSize: 11.5,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        height: 1.40,
        color: AppColors.darkTextMuted,
      );
}
