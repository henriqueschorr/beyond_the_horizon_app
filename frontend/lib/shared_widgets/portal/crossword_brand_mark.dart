import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/color/app_colors.dart';

/// Monumental typographic crossword brand mark specified in SDD 04 Section 6.1.
/// B-E-Y-O-N-D intersects H-O-R-I-Z-O-N sharing the letter 'O'.
/// 'THE' is tucked 4 font sizes smaller to the right of 'Y'.
/// Submerged letters 'N' and 'D' sit visibly within the black hole void.
class CrosswordBrandMark extends StatelessWidget {
  final double scale;
  final bool showSubmergedLetters;

  const CrosswordBrandMark({
    super.key,
    this.scale = 1.0,
    this.showSubmergedLetters = true,
  });

  @override
  Widget build(BuildContext context) {
    final double letterSize = 64.0 * scale;
    final double letterSpacing = 12.0 * scale;
    final double cellSize = letterSize + letterSpacing;
    final double theFontSize = 16.0 * scale;

    final monumentalStyle = GoogleFonts.spaceGrotesk(
      fontSize: letterSize,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
      height: 1.0,
      letterSpacing: 4.0,
    );

    final particleTheStyle = GoogleFonts.spaceGrotesk(
      fontSize: theFontSize,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextPrimary,
      height: 1.0,
      letterSpacing: 4.0 * scale,
    );

    Widget buildLetter(String char) {
      return SizedBox(
        width: cellSize,
        height: cellSize,
        child: Center(
          child: Text(
            char,
            style: monumentalStyle,
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upper section: B, E, Y + THE
        // Offset horizontally to match the 'O' in HORIZON (column 1)
        Padding(
          padding: EdgeInsets.only(left: cellSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildLetter('B'),
              buildLetter('E'),
              SizedBox(
                height: cellSize,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildLetter('Y'),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.0 * scale,
                        bottom: (letterSpacing / 2) + (6.0 * scale),
                      ),
                      child: Text('THE', style: particleTheStyle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Intersection row: H - O - R - I - Z - O - N
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildLetter('H'),
            buildLetter('O'), // Intersects BEYOND
            buildLetter('R'),
            buildLetter('I'),
            buildLetter('Z'),
            buildLetter('O'),
            buildLetter('N'),
          ],
        ),

        // Submerged letters in the void: N, D
        if (showSubmergedLetters)
          Padding(
            padding: EdgeInsets.only(left: cellSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLetter('N'),
                buildLetter('D'),
              ],
            ),
          ),
      ],
    );
  }
}
