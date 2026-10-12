/// Request DTO for initiating password recovery.
class PasswordResetRequestDto {
  final String email;

  const PasswordResetRequestDto({
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email.trim().toLowerCase(),
    };
  }

  factory PasswordResetRequestDto.fromMap(Map<String, dynamic> map) {
    return PasswordResetRequestDto(
      email: (map['email'] as String? ?? '').trim().toLowerCase(),
    );
  }
}
