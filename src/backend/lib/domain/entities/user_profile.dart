import 'package:shared/shared.dart';

/// Database entity matching public.profiles schema.
class UserProfile {
  final String id;
  final String displayName;
  final UserRole role;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserProfile({
    required this.id,
    required this.displayName,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  UserProfile copyWith({
    String? displayName,
    UserRole? role,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id,
      displayName: displayName ?? this.displayName,
      role: role ?? this.role,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  UserProfileResponseDto toResponseDto() {
    return UserProfileResponseDto(
      id: id,
      displayName: displayName,
      role: role,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
