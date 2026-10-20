import 'package:shared/shared.dart';

/// Abstract contract for operative dossier profile querying and updates.
abstract class ProfileRepository {
  /// Retrieves operative profile by user identifier.
  Future<UserProfileResponseDto?> getProfileById(String id);

  /// Updates profile metadata, strictly protecting role assignment.
  Future<UserProfileResponseDto> updateProfile(
    String id,
    String displayName,
  );
}
