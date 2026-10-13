import 'package:flutter/material.dart';

import '../../../theme/typograph/semantic_text_widgets.dart';

/// Monumental typographic crossword brand mark specified in SDD 04 Section 6.1.
/// B-E-Y-O-N-D intersects H-O-R-I-Z-O-N sharing the letter 'O'.
/// 'THE' is tucked to the right of 'Y'.
/// Submerged letters 'N' and 'D' sit visibly within the void.
class CrosswordBrandMark extends StatelessWidget {
  final double scale;

  const CrosswordBrandMark({
    super.key,
    this.scale = 1.0,
  });

  static const double baseCellSize = 76.0;

  @override
  Widget build(BuildContext context) {
    const double cellSize = baseCellSize;

    Widget buildLetter(String char) {
      return SizedBox(
        width: cellSize,
        height: cellSize,
        child: Center(
          child: MonumentalText(char),
        ),
      );
    }

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upper section: B, E, Y + THE
        // Offset horizontally to align with the 'O' in HORIZON (column 1)
        Padding(
          padding: const EdgeInsets.only(left: cellSize),
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
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        bottom: 12.0,
                      ),
                      child: MonumentalSmallText('THE'),
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
            buildLetter('O'), // Shared with BEYOND, same uniform color
            buildLetter('R'),
            buildLetter('I'),
            buildLetter('Z'),
            buildLetter('O'),
            buildLetter('N'),
          ],
        ),

        // Submerged lower section: N, D
        Padding(
          padding: const EdgeInsets.only(left: cellSize),
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

    if (scale != 1.0) {
      return Transform.scale(
        scale: scale,
        alignment: Alignment.topLeft,
        child: content,
      );
    }

    return content;
  }
}
