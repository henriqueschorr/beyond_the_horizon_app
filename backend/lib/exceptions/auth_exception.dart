/// Machine-readable exception for authentication failures.
/// Error codes allow the frontend to map exceptions strictly to localized strings.
class AuthException implements Exception {
  final String code;
  final String? message;

  const AuthException(this.code, [this.message]);

  static const String invalidCredentials = 'invalid_credentials';
  static const String emailAlreadyExists = 'email_already_exists';
  static const String userNotFound = 'user_not_found';
  static const String invalidSession = 'invalid_session';

  @override
  String toString() => 'AuthException: $code';
}
