/// Response DTO representing an authenticated operative session.
class AuthSessionResponseDto {
  final String userId;
  final String email;
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const AuthSessionResponseDto({
    required this.userId,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().toUtc().isAfter(expiresAt);

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'email': email,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_at': expiresAt.toUtc().toIso8601String(),
    };
  }

  factory AuthSessionResponseDto.fromMap(Map<String, dynamic> map) {
    return AuthSessionResponseDto(
      userId: map['user_id'] as String? ?? '',
      email: map['email'] as String? ?? '',
      accessToken: map['access_token'] as String? ?? '',
      refreshToken: map['refresh_token'] as String? ?? '',
      expiresAt: DateTime.tryParse(map['expires_at'] as String? ?? '')?.toUtc() ??
          DateTime.now().toUtc().add(const Duration(hours: 1)),
    );
  }
}
