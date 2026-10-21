import 'package:shared/shared.dart';

/// Abstract contract for player profile querying and updates.
abstract class ProfileRepository {
  /// Retrieves player profile by user identifier.
  Future<UserProfileResponseDto?> getProfileById(String id);

  /// Updates profile metadata, strictly protecting role assignment.
  Future<UserProfileResponseDto> updateProfile(
    String id,
    String displayName,
  );
}
