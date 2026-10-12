/// Request DTO for updating an operative's dossier.
class UpdateProfileRequestDto {
  final String? displayName;

  const UpdateProfileRequestDto({
    this.displayName,
  });

  Map<String, dynamic> toMap() {
    return {
      if (displayName != null) 'display_name': displayName!.trim(),
    };
  }

  factory UpdateProfileRequestDto.fromMap(Map<String, dynamic> map) {
    return UpdateProfileRequestDto(
      displayName: map['display_name'] as String?,
    );
  }
}
