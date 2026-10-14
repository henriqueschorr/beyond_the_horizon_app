import 'package:flutter/material.dart';
import '../../theme/color/app_colors.dart';
import '../../theme/typograph/app_typography.dart';
import '../../theme/typograph/semantic_text_widgets.dart';

/// Recessed credential and telemetry input well specified in SDD 04 Section 6.3.
/// Dark well background (#0C0E10), 1px border (#282E36), and accent orange (#FE6403) caret.
class RecessedInputField extends StatefulWidget {
  final String label;
  final String? placeholder;
  final TextEditingController? controller;
  final bool isPassword;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? errorText;
  final TextInputAction textInputAction;

  const RecessedInputField({
    super.key,
    required this.label,
    this.placeholder,
    this.controller,
    this.isPassword = false,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.textInputAction = TextInputAction.next,
  });

  @override
  State<RecessedInputField> createState() => _RecessedInputFieldState();
}

class _RecessedInputFieldState extends State<RecessedInputField> {
  late bool _obscured;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscured = widget.isPassword;
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_isFocused != _focusNode.hasFocus) {
      setState(() => _isFocused = _focusNode.hasFocus);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleObscured() {
    setState(() => _obscured = !_obscured);
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = (widget.errorText != null || _isFocused)
        ? AppColors.accentOrange
        : AppColors.darkBorderSubtle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label Header
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: _isFocused
              ? TacticalLabelSmallHighlightedText(widget.label.toUpperCase())
              : TacticalLabelSmallText(widget.label.toUpperCase()),
        ),

        // Recessed Input Well
        Container(
          height: 44.0,
          decoration: BoxDecoration(
            color: AppColors.darkBgWell,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: borderColor, width: 1.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  obscureText: _obscured,
                  onChanged: widget.onChanged,
                  onSubmitted: widget.onSubmitted,
                  textInputAction: widget.textInputAction,
                  cursorColor: AppColors.accentOrange,
                  cursorWidth: 3.0,
                  cursorRadius: const Radius.circular(1.0),
                  style: AppTypography.tacticalLabel.copyWith(
                    color: AppColors.darkTextPrimary,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
                    border: InputBorder.none,
                    isDense: true,
                    hintText: widget.placeholder,
                    hintStyle: AppTypography.tacticalLabelSmall.copyWith(
                      color: AppColors.darkTextMuted,
                    ),
                  ),
                ),
              ),
              if (widget.isPassword)
                IconButton(
                  icon: Icon(
                    _obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    size: 18.0,
                    color: _isFocused ? AppColors.accentOrange : AppColors.darkTextMuted,
                  ),
                  onPressed: _toggleObscured,
                  splashRadius: 18.0,
                ),
            ],
          ),
        ),

        // Inline Error Feedback
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: LegendHighlightedText(
              widget.errorText!,
            ),
          ),
      ],
    );
  }
}
