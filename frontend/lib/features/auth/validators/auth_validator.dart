import '../../../l10n/app_localizations.dart';

/// Specialized validation service for operative credentials and enlistment boundaries.
/// Strictly complies with Rule 12: all error messages originate from AppLocalizations.
class AuthValidator {
  const AuthValidator();

  static final Pattern _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  /// Validates email presence and RFC 5322 format.
  String? validateEmail(String? value, AppLocalizations l10n) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return l10n.errors.emptyEmail;
    }
    if (_emailPattern.allMatches(email).isEmpty) {
      return l10n.errors.invalidEmail;
    }
    return null;
  }

  /// Validates password presence and minimum length (8 chars).
  String? validatePassword(String? value, AppLocalizations l10n) {
    final password = value ?? '';
    if (password.isEmpty) {
      return l10n.errors.emptyPassword;
    }
    if (password.length < 8) {
      return l10n.errors.passwordTooShort;
    }
    return null;
  }

  /// Validates operative callsign / name.
  String? validateCallsign(String? value, AppLocalizations l10n) {
    final callsign = value?.trim() ?? '';
    if (callsign.isEmpty) {
      return l10n.errors.emptyCallsign;
    }
    if (callsign.length > 50) {
      return l10n.errors.callsignTooLong;
    }
    return null;
  }

  /// Validates sign-in credentials before submission.
  String? validateSignIn({
    required String email,
    required String password,
    required AppLocalizations l10n,
  }) {
    if (email.trim().isEmpty) {
      return l10n.errors.emptyEmail;
    }
    if (password.isEmpty) {
      return l10n.errors.emptyPassword;
    }
    return null;
  }

  /// Validates registration/enlistment inputs before submission.
  String? validateSignUp({
    required String email,
    required String password,
    required String displayName,
    required AppLocalizations l10n,
  }) {
    final callsignError = validateCallsign(displayName, l10n);
    if (callsignError != null) return callsignError;

    final emailError = validateEmail(email, l10n);
    if (emailError != null) return emailError;

    final passwordError = validatePassword(password, l10n);
    if (passwordError != null) return passwordError;

    return null;
  }
}
