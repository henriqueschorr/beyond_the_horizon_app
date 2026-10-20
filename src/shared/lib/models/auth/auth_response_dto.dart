import '../profiles/user_profile_response_dto.dart';
import 'auth_session_response_dto.dart';

/// Response DTO containing an authenticated operative session and profile.
class AuthResponseDto {
  final AuthSessionResponseDto session;
  final UserProfileResponseDto profile;

  const AuthResponseDto({
    required this.session,
    required this.profile,
  });

  Map<String, dynamic> toMap() {
    return {
      'session': session.toMap(),
      'profile': profile.toMap(),
    };
  }

  factory AuthResponseDto.fromMap(Map<String, dynamic> map) {
    return AuthResponseDto(
      session: AuthSessionResponseDto.fromMap(
        map['session'] as Map<String, dynamic>? ?? {},
      ),
      profile: UserProfileResponseDto.fromMap(
        map['profile'] as Map<String, dynamic>? ?? {},
      ),
    );
  }
}
