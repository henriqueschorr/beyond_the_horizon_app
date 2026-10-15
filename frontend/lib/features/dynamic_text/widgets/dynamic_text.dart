import 'package:flutter/material.dart';

import '../../../theme/typograph/app_typography.dart';

/// Dynamic narrative text widget that processes custom presentation tags.
/// Preserves original classification text tokens (such as [REDACTED] or [OMITIDO]).
/// Further syntax extensions and layout callouts will be established in OP-03B.
class DynamicText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const DynamicText(
    this.text, {
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? AppTypography.bodyMono;

    return Text(
      text,
      style: effectiveStyle,
    );
  }
}
