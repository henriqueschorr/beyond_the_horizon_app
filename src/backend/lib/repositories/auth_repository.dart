import 'package:shared/shared.dart';

/// Abstract contract for authentication and session management.
abstract class AuthRepository {
  /// Authenticates an operative using email and password.
  Future<AuthSessionResponseDto> signInWithPassword(String email, String password);

  /// Registers a new operative and provisions their session.
  Future<AuthSessionResponseDto> signUp(String email, String password, String displayName);

  /// Invalidates an active session token.
  Future<void> signOut(String sessionToken);

  /// Initiates password recovery workflow for the specified email.
  Future<void> resetPasswordForEmail(String email);

  /// Validates and returns session data for an active session token.
  Future<AuthSessionResponseDto?> getUserSession(String sessionToken);
}
