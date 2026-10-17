import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color/app_colors.dart';

/// Central typography styles defined in SDD 04 Section 4.2.
/// Features Space Grotesk, Space Mono, and Inter font families.
abstract final class AppTypography {
  static TextStyle get monumentalTitle => GoogleFonts.spaceGrotesk(
        fontSize: 64.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 4.0,
        height: 1.0,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get monumentalSmall => GoogleFonts.spaceGrotesk(
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 4.0,
        height: 1.0,
        color: AppColors.darkTextPrimary,
      );

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

  static TextStyle get displayTitleHighlighted => GoogleFonts.spaceGrotesk(
        fontSize: 26.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.2,
        height: 1.15,
        color: AppColors.accentOrange,
      );


  static TextStyle get sectionTitle => GoogleFonts.spaceGrotesk(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.1,
        height: 1.20,
        color: AppColors.darkTextPrimary,
      );

  static TextStyle get actionLabelLarge => GoogleFonts.spaceGrotesk(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        height: 1.20,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get actionLabelLargeInverted => GoogleFonts.spaceGrotesk(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        height: 1.20,
        color: AppColors.darkBgCanvas,
      );

  static TextStyle get actionLabel => GoogleFonts.spaceGrotesk(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.10,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get actionLabelHighlighted => GoogleFonts.spaceGrotesk(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.10,
        color: AppColors.accentOrange,
      );

  static TextStyle get actionLabelMuted => GoogleFonts.spaceGrotesk(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.10,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get actionLabelSmall => GoogleFonts.spaceGrotesk(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get actionLabelSmallHighlighted => GoogleFonts.spaceGrotesk(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.accentOrange,
      );

  static TextStyle get actionLabelSmallMuted => GoogleFonts.spaceGrotesk(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.darkTextMuted,
      );

  static TextStyle get actionLabelSmallInverted => GoogleFonts.spaceGrotesk(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.darkBgCanvas,
      );

  static TextStyle get navAnchor => GoogleFonts.spaceGrotesk(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        height: 1.20,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get navAnchorHighlighted => GoogleFonts.spaceGrotesk(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        height: 1.20,
        color: AppColors.accentOrange,
      );

  static TextStyle get fieldLabel => GoogleFonts.spaceMono(
        fontSize: 11.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get fieldLabelHighlighted => GoogleFonts.spaceMono(
        fontSize: 11.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.accentOrange,
      );

  static TextStyle get fieldLabelMuted => GoogleFonts.spaceMono(
        fontSize: 11.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.darkTextMuted,
      );

  static TextStyle get fieldLabelInverted => GoogleFonts.spaceMono(
        fontSize: 11.5,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.darkBgCanvas,
      );

  static TextStyle get fieldInput => GoogleFonts.spaceMono(
        fontSize: 12.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        height: 1.20,
        color: AppColors.darkTextSecondary,
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

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        height: 1.70,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get body => GoogleFonts.inter(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        height: 1.60,
        color: AppColors.darkTextSecondary,
      );

  static TextStyle get bodyMono => GoogleFonts.spaceMono(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.0,
        height: 1.60,
        color: AppColors.darkTextSecondary,
      );
}
