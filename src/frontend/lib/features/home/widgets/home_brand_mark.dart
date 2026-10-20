import 'package:flutter/material.dart';

import '../../../theme/typograph/semantic_text_widgets.dart';

/// Monumental typographic brand mark on the Command Deck adhering to SDD 04 Section 7.1.
/// Features mathematical two-row geometry where the 'O' in BEYOND (column 3)
/// vertically aligns with the first 'O' in HORIZON (column 3).
class HomeBrandMark extends StatelessWidget {
  final double scale;

  const HomeBrandMark({
    super.key,
    this.scale = 1.0,
  });

  static const double baseCellSize = 44.0;

  @override
  Widget build(BuildContext context) {
    const double cellSize = baseCellSize;

    Widget buildLetter(String char) {
      return SizedBox(
        width: cellSize,
        height: cellSize,
        child: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: MonumentalText(char),
          ),
        ),
      );
    }

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row 1: B - E - Y - O - N - D + THE
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            buildLetter('B'),
            buildLetter('E'),
            buildLetter('Y'),
            buildLetter('O'), // Column 3: Aligns with Row 2 'O'
            buildLetter('N'),
            buildLetter('D'),
            const SizedBox(width: 8.0),
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: MonumentalSmallText('THE'),
            ),
          ],
        ),

        const SizedBox(height: 2.0),

        // Row 2: [ B T H ] - H - O - R - I - Z - O - N
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // [BTH] Telemetry Badge spanning Column 0 and Column 1
            SizedBox(
              width: cellSize * 2,
              height: cellSize,
              child: const Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: ActionLabelHighlightedText('[ B T H ]'),
                ),
              ),
            ),
            buildLetter('H'), // Column 2
            buildLetter('O'), // Column 3: Perfectly aligns with Row 1 'O'
            buildLetter('R'), // Column 4
            buildLetter('I'), // Column 5
            buildLetter('Z'), // Column 6
            buildLetter('O'), // Column 7
            buildLetter('N'), // Column 8
          ],
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
