import 'package:shared/shared.dart';
import '../../domain/entities/user_profile.dart';
import '../../exceptions/profile_exception.dart';
import '../profile_repository.dart';
import 'mock_seeds.dart';

/// In-memory mock implementation of ProfileRepository pre-seeded with Vance Specter.
class MockProfileRepository implements ProfileRepository {
  final Map<String, UserProfile> _profiles = {};

  MockProfileRepository() {
    _profiles.addAll(MockSeeds.createInitialProfiles());
  }

  void createProfile(UserProfile profile) {
    _profiles[profile.id] = profile;
  }

  @override
  Future<UserProfileResponseDto?> getProfileById(String id) async {
    final entity = _profiles[id];
    return entity?.toResponseDto();
  }

  @override
  Future<UserProfileResponseDto> updateProfile(
    String id,
    String displayName,
  ) async {
    final existing = _profiles[id];
    if (existing == null) {
      throw const ProfileException(ProfileException.profileNotFound);
    }

    final updated = existing.copyWith(
      displayName: displayName.trim(),
      updatedAt: DateTime.now().toUtc(),
    );

    _profiles[id] = updated;
    return updated.toResponseDto();
  }
}
