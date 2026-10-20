import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shared/shared.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/user_profile.dart';
import '../../exceptions/auth_exception.dart';
import '../auth_repository.dart';
import 'mock_profile_repository.dart';
import 'mock_seeds.dart';

class _MockAccount {
  final String userId;
  final String email;
  final String passwordHash;

  _MockAccount({
    required this.userId,
    required this.email,
    required this.passwordHash,
  });
}

/// In-memory mock implementation of AuthRepository pre-seeded with Vance Specter.
class MockAuthRepository implements AuthRepository {
  final MockProfileRepository _profileRepository;
  final Uuid _uuid = const Uuid();

  final Map<String, _MockAccount> _accountsByEmail = {};
  final Map<String, AuthSessionResponseDto> _sessionsByToken = {};

  MockAuthRepository({
    required MockProfileRepository profileRepository,
  }) : _profileRepository = profileRepository {
    _seedDefaultAccount();
  }

  void _seedDefaultAccount() {
    for (final seed in MockSeeds.createInitialAccounts()) {
      _accountsByEmail[seed.email] = _MockAccount(
        userId: seed.userId,
        email: seed.email,
        passwordHash: _hashPassword(seed.password),
      );
    }
  }

  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  String _generateToken() {
    return 'bth_${_uuid.v4().replaceAll('-', '')}';
  }

  @override
  Future<AuthSessionResponseDto> signInWithPassword(String email, String password) async {
    final normalizedEmail = email.trim().toLowerCase();
    var account = _accountsByEmail[normalizedEmail];

    // In mock mode, allow any credentials to pass by auto-provisioning an operative account
    if (account == null) {
      final userId = _uuid.v4();
      final displayName = normalizedEmail.contains('@')
          ? normalizedEmail.split('@').first
          : (normalizedEmail.isNotEmpty ? normalizedEmail : 'Operative');

      account = _MockAccount(
        userId: userId,
        email: normalizedEmail,
        passwordHash: _hashPassword(password),
      );
      _accountsByEmail[normalizedEmail] = account;

      final now = DateTime.now().toUtc();
      final profile = UserProfile(
        id: userId,
        displayName: displayName,
        role: UserRole.player,
        createdAt: now,
        updatedAt: now,
      );
      _profileRepository.createProfile(profile);
    }

    final token = _generateToken();
    final refreshToken = _generateToken();
    final expiresAt = DateTime.now().toUtc().add(const Duration(hours: 24));

    final session = AuthSessionResponseDto(
      userId: account.userId,
      email: account.email,
      accessToken: token,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );

    _sessionsByToken[token] = session;
    return session;
  }

  @override
  Future<AuthSessionResponseDto> signUp(String email, String password, String displayName) async {
    final normalizedEmail = email.trim().toLowerCase();
    if (_accountsByEmail.containsKey(normalizedEmail)) {
      throw const AuthException(AuthException.emailAlreadyExists);
    }

    final userId = _uuid.v4();
    final account = _MockAccount(
      userId: userId,
      email: normalizedEmail,
      passwordHash: _hashPassword(password),
    );
    _accountsByEmail[normalizedEmail] = account;

    final now = DateTime.now().toUtc();
    final profile = UserProfile(
      id: userId,
      displayName: displayName.trim(),
      role: UserRole.player,
      createdAt: now,
      updatedAt: now,
    );
    _profileRepository.createProfile(profile);

    final token = _generateToken();
    final refreshToken = _generateToken();
    final expiresAt = now.add(const Duration(hours: 24));

    final session = AuthSessionResponseDto(
      userId: userId,
      email: normalizedEmail,
      accessToken: token,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );

    _sessionsByToken[token] = session;
    return session;
  }

  @override
  Future<void> signOut(String sessionToken) async {
    _sessionsByToken.remove(sessionToken);
  }

  @override
  Future<void> resetPasswordForEmail(String email) async {
    // In mock mode, simply simulate successful transmission
    final normalizedEmail = email.trim().toLowerCase();
    if (!_accountsByEmail.containsKey(normalizedEmail)) {
      // Intentionally silent or generic to prevent account enumeration (OWASP A07)
      return;
    }
  }

  @override
  Future<AuthSessionResponseDto?> getUserSession(String sessionToken) async {
    final session = _sessionsByToken[sessionToken];
    if (session == null || session.isExpired) {
      if (session != null) {
        _sessionsByToken.remove(sessionToken);
      }
      return null;
    }
    return session;
  }
}
