import 'package:flutter/material.dart';
import 'app_typography.dart';

/// Semantic typography widgets complying strictly with Rule 11 of Agents.md.
/// Raw Text(...) and inline TextStyle(...) are prohibited in feature code.

class MonumentalText extends StatelessWidget {
  final String text;

  const MonumentalText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.monumentalTitle,
    );
  }
}

class MonumentalSmallText extends StatelessWidget {
  final String text;

  const MonumentalSmallText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.monumentalSmall,
    );
  }
}

/// Dedicated selectable error message widget allowing users to highlight and copy diagnostic/auth errors directly.
class SelectableErrorText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const SelectableErrorText(
    this.text, {
    super.key,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      textAlign: textAlign,
      style: AppTypography.legendHighlighted,
    );
  }
}

class DisplayTitleLargeText extends StatelessWidget {
  final String text;

  const DisplayTitleLargeText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.displayTitleLarge,
    );
  }
}

class DisplayTitleText extends StatelessWidget {
  final String text;

  const DisplayTitleText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.displayTitle,
    );
  }
}

class SectionTitleText extends StatelessWidget {
  final String text;

  const SectionTitleText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.sectionTitle,
    );
  }
}

class ActionLabelText extends StatelessWidget {
  final String text;

  const ActionLabelText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.actionLabel,
    );
  }
}

class NavAnchorText extends StatelessWidget {
  final String text;

  const NavAnchorText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.navAnchor,
    );
  }
}

class NavAnchorHighlightedText extends StatelessWidget {
  final String text;

  const NavAnchorHighlightedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.navAnchorHighlighted,
    );
  }
}

class TacticalLabelText extends StatelessWidget {
  final String text;

  const TacticalLabelText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.tacticalLabel,
    );
  }
}

class TacticalLabelHighlightedText extends StatelessWidget {
  final String text;

  const TacticalLabelHighlightedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.tacticalLabelHighlighted,
    );
  }
}

class TacticalLabelSmallText extends StatelessWidget {
  final String text;

  const TacticalLabelSmallText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.tacticalLabelSmall,
    );
  }
}

class TacticalLabelSmallHighlightedText extends StatelessWidget {
  final String text;

  const TacticalLabelSmallHighlightedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.tacticalLabelSmallHighlighted,
    );
  }
}

class LegendText extends StatelessWidget {
  final String text;

  const LegendText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.legend,
    );
  }
}

/// Highlighted legend text used for status signals and inline error notices.
/// Retains textAlign to support centered telemetry callouts.
class LegendHighlightedText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const LegendHighlightedText(
    this.text, {
    super.key,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppTypography.legendHighlighted,
    );
  }
}

class BodyLargeText extends StatelessWidget {
  final String text;

  const BodyLargeText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.bodyLarge,
    );
  }
}

class BodyMediumText extends StatelessWidget {
  final String text;

  const BodyMediumText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.bodyMedium,
    );
  }
}

class BodyProseText extends StatelessWidget {
  final String text;

  const BodyProseText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.bodyProse,
    );
  }
}

class BodyProseSmallText extends StatelessWidget {
  final String text;

  const BodyProseSmallText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.bodyProseSmall,
    );
  }
}
