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

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upper section: B, E, Y + THE
        // Offset horizontally to align with the 'O' in HORIZON (column 1)
        const Padding(
          padding: EdgeInsets.only(left: cellSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _CrosswordLetterTile(char: 'B'),
              _CrosswordLetterTile(char: 'E'),
              SizedBox(
                height: cellSize,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _CrosswordLetterTile(char: 'Y'),
                    Padding(
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
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _CrosswordLetterTile(char: 'H'),
            _CrosswordLetterTile(char: 'O'), // Shared with BEYOND, same uniform color
            _CrosswordLetterTile(char: 'R'),
            _CrosswordLetterTile(char: 'I'),
            _CrosswordLetterTile(char: 'Z'),
            _CrosswordLetterTile(char: 'O'),
            _CrosswordLetterTile(char: 'N'),
          ],
        ),

        // Submerged lower section: N, D
        const Padding(
          padding: EdgeInsets.only(left: cellSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _CrosswordLetterTile(char: 'N'),
              _CrosswordLetterTile(char: 'D'),
            ],
          ),
        ),
      ],
    );

    if (scale != 1.0) {
      return Transform.scale(
        scale: scale,
        alignment: Alignment.topCenter,
        child: content,
      );
    }

    return content;
  }
}

/// Dedicated private letter tile widget adhering strictly to Rule 7 and Rule 10 of Agents.md.
class _CrosswordLetterTile extends StatelessWidget {
  final String char;

  const _CrosswordLetterTile({
    required this.char,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: CrosswordBrandMark.baseCellSize,
      height: CrosswordBrandMark.baseCellSize,
      child: Center(
        child: MonumentalText(char),
      ),
    );
  }
}

