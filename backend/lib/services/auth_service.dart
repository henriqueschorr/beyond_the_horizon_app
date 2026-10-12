import 'package:shared/shared.dart';
import '../dependency_injection/service_locator.dart';
import '../exceptions/auth_exception.dart';
import '../repositories/auth_repository.dart';
import '../repositories/profile_repository.dart';

/// Domain service coordinating operative authentication, session lifecycle, and profile resolution.
class AuthService {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  AuthService({
    AuthRepository? authRepository,
    ProfileRepository? profileRepository,
  })  : _authRepository = authRepository ?? serviceLocator<AuthRepository>(),
        _profileRepository = profileRepository ?? serviceLocator<ProfileRepository>();

  Future<AuthResponseDto> signIn(SignInRequestDto request) async {
    final session = await _authRepository.signInWithPassword(
      request.email,
      request.password,
    );

    final profile = await _profileRepository.getProfileById(session.userId);
    if (profile == null) {
      throw const AuthException(AuthException.userNotFound);
    }

    return AuthResponseDto(session: session, profile: profile);
  }

  Future<AuthResponseDto> signUp(SignUpRequestDto request) async {
    final session = await _authRepository.signUp(
      request.email,
      request.password,
      request.displayName,
    );

    final profile = await _profileRepository.getProfileById(session.userId);
    if (profile == null) {
      throw const AuthException(AuthException.userNotFound);
    }

    return AuthResponseDto(session: session, profile: profile);
  }

  Future<void> signOut(String sessionToken) async {
    if (sessionToken.trim().isEmpty) return;
    await _authRepository.signOut(sessionToken);
  }

  Future<void> requestPasswordReset(PasswordResetRequestDto request) async {
    await _authRepository.resetPasswordForEmail(request.email);
  }

  Future<AuthResponseDto?> validateSession(String sessionToken) async {
    if (sessionToken.trim().isEmpty) return null;
    final session = await _authRepository.getUserSession(sessionToken);
    if (session == null) return null;

    final profile = await _profileRepository.getProfileById(session.userId);
    if (profile == null) return null;

    return AuthResponseDto(session: session, profile: profile);
  }
}
