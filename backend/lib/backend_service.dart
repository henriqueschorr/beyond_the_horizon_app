import 'services/auth_service.dart';
import 'services/lore_epigraph_service.dart';
import 'services/profile_service.dart';

/// Unified facade brokering in-process domain calls between frontend and backend.
/// Exposes zero-latency class.method() execution with shared DTO wire contracts.
class BackendService {
  final AuthService auth;
  final ProfileService profile;
  final LoreEpigraphService loreEpigraph;

  BackendService({
    required this.auth,
    required this.profile,
    required this.loreEpigraph,
  });
}

