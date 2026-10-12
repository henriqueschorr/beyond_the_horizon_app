/// Request DTO for new operative registration.
class SignUpRequestDto {
  final String email;
  final String password;
  final String displayName;

  const SignUpRequestDto({
    required this.email,
    required this.password,
    required this.displayName,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email.trim().toLowerCase(),
      'password': password,
      'display_name': displayName.trim(),
    };
  }

  factory SignUpRequestDto.fromMap(Map<String, dynamic> map) {
    return SignUpRequestDto(
      email: (map['email'] as String? ?? '').trim().toLowerCase(),
      password: map['password'] as String? ?? '',
      displayName: (map['display_name'] as String? ?? '').trim(),
    );
  }
}
