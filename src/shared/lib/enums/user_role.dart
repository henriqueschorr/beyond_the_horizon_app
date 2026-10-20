/// Represents the operative access role across Beyond the Horizon App.
/// Matches the public.user_role PostgreSQL enum.
enum UserRole {
  player,
  facilitator,
  admin;

  static UserRole fromDbString(String value) {
    switch (value.trim().toLowerCase()) {
      case 'player':
        return UserRole.player;
      case 'facilitator':
        return UserRole.facilitator;
      case 'admin':
        return UserRole.admin;
      default:
        throw ArgumentError('Invalid user_role database string: $value');
    }
  }

  String toDbString() {
    switch (this) {
      case UserRole.player:
        return 'player';
      case UserRole.facilitator:
        return 'facilitator';
      case UserRole.admin:
        return 'admin';
    }
  }
}
