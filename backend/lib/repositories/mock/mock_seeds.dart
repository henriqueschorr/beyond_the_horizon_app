import 'package:shared/shared.dart';
import '../../domain/entities/user_profile.dart';

class MockAccountSeed {
  final String userId;
  final String email;
  final String password;

  const MockAccountSeed({
    required this.userId,
    required this.email,
    required this.password,
  });
}

/// Seed data definitions for local and mock development environments.
/// Decoupled from repository logic to allow independent fixture configuration.
class MockSeeds {
  static const String defaultOperativeId = '00000000-0000-4000-8000-000000000001';
  static const String defaultEmail = 'operative.vance@beyondthehorizon.space';
  static const String defaultCallsign = 'Vance "Specter"';
  static const String defaultPassword = 'Specter2026!';

  /// Generates pre-seeded operative accounts.
  static List<MockAccountSeed> createInitialAccounts() {
    return const [
      MockAccountSeed(
        userId: defaultOperativeId,
        email: defaultEmail,
        password: defaultPassword,
      ),
    ];
  }

  /// Generates pre-seeded operative profiles.
  static Map<String, UserProfile> createInitialProfiles() {
    final now = DateTime.now().toUtc();
    return {
      defaultOperativeId: UserProfile(
        id: defaultOperativeId,
        displayName: defaultCallsign,
        role: UserRole.player,
        createdAt: now.subtract(const Duration(days: 30)),
        updatedAt: now,
      ),
    };
  }
}
