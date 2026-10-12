/// Machine-readable exception for operative profile failures.
/// Error codes allow the frontend to map exceptions strictly to localized strings.
class ProfileException implements Exception {
  final String code;
  final String? message;

  const ProfileException(this.code, [this.message]);

  static const String profileNotFound = 'profile_not_found';

  @override
  String toString() => 'ProfileException: $code';
}
