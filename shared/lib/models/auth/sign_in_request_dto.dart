/// Request DTO for operative authentication.
class SignInRequestDto {
  final String email;
  final String password;

  const SignInRequestDto({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email.trim().toLowerCase(),
      'password': password,
    };
  }

  factory SignInRequestDto.fromMap(Map<String, dynamic> map) {
    return SignInRequestDto(
      email: (map['email'] as String? ?? '').trim().toLowerCase(),
      password: map['password'] as String? ?? '',
    );
  }
}
