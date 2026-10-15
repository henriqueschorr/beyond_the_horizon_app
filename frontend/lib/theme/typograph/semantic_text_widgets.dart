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

class DisplayTitleHighlightedText extends StatelessWidget {
  final String text;

  const DisplayTitleHighlightedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.displayTitleHighlighted,
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

class ActionLabelLargeText extends StatelessWidget {
  final String text;

  const ActionLabelLargeText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.actionLabelLarge,
    );
  }
}

class ActionLabelLargeInvertedText extends StatelessWidget {
  final String text;

  const ActionLabelLargeInvertedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.actionLabelLargeInverted,
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

class ActionLabelHighlightedText extends StatelessWidget {
  final String text;

  const ActionLabelHighlightedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.actionLabelHighlighted,
    );
  }
}

class ActionLabelMutedText extends StatelessWidget {
  final String text;

  const ActionLabelMutedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.actionLabelMuted,
    );
  }
}

class ActionLabelSmallText extends StatelessWidget {
  final String text;

  const ActionLabelSmallText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.actionLabelSmall,
    );
  }
}

class ActionLabelSmallHighlightedText extends StatelessWidget {
  final String text;

  const ActionLabelSmallHighlightedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.actionLabelSmallHighlighted,
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

class FieldLabelText extends StatelessWidget {
  final String text;

  const FieldLabelText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.fieldLabel,
    );
  }
}

class FieldLabelHighlightedText extends StatelessWidget {
  final String text;

  const FieldLabelHighlightedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.fieldLabelHighlighted,
    );
  }
}

class FieldLabelMutedText extends StatelessWidget {
  final String text;

  const FieldLabelMutedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.fieldLabelMuted,
    );
  }
}

class FieldInputText extends StatelessWidget {
  final String text;

  const FieldInputText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.fieldInput,
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

class ActionLabelSmallMutedText extends StatelessWidget {
  final String text;

  const ActionLabelSmallMutedText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.actionLabelSmallMuted,
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;

  const BodyText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.body,
    );
  }
}

class BodyMonoText extends StatelessWidget {
  final String text;

  const BodyMonoText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.bodyMono,
    );
  }
}


