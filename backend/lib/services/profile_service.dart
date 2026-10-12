import 'package:shared/shared.dart';
import '../dependency_injection/service_locator.dart';
import '../repositories/profile_repository.dart';

/// Domain service managing operative dossier profile operations and OWASP input boundaries.
class ProfileService {
  final ProfileRepository _profileRepository;

  ProfileService({
    ProfileRepository? profileRepository,
  }) : _profileRepository = profileRepository ?? serviceLocator<ProfileRepository>();

  Future<UserProfileResponseDto?> getProfile(String userId) async {
    if (userId.trim().isEmpty) return null;
    return await _profileRepository.getProfileById(userId);
  }

  Future<UserProfileResponseDto> updateProfile(
    String userId,
    UpdateProfileRequestDto request,
  ) async {
    final existing = await _profileRepository.getProfileById(userId);
    if (existing == null) {
      throw StateError('profile_not_found');
    }

    final newDisplayName = request.displayName ?? existing.displayName;

    return await _profileRepository.updateProfile(
      userId,
      newDisplayName,
    );
  }
}
