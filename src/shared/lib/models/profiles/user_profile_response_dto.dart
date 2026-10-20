import '../../enums/user_role.dart';

/// Response DTO representing an operative's personnel dossier profile.
class UserProfileResponseDto {
  final String id;
  final String displayName;
  final UserRole role;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserProfileResponseDto({
    required this.id,
    required this.displayName,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'display_name': displayName,
      'role': role.toDbString(),
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
    };
  }

  factory UserProfileResponseDto.fromMap(Map<String, dynamic> map) {
    return UserProfileResponseDto(
      id: map['id'] as String? ?? '',
      displayName: map['display_name'] as String? ?? '',
      role: UserRole.fromDbString(map['role'] as String? ?? 'player'),
      createdAt: DateTime.tryParse(map['created_at'] as String? ?? '')?.toUtc() ??
          DateTime.now().toUtc(),
      updatedAt: DateTime.tryParse(map['updated_at'] as String? ?? '')?.toUtc() ??
          DateTime.now().toUtc(),
    );
  }
}
