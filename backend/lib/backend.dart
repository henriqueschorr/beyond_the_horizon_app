library backend;

// Facade
export 'backend_service.dart';

// Dependency Injection
export 'dependency_injection/service_locator.dart';

// Domain Entities
export 'domain/entities/user_profile.dart';

// Exceptions
export 'exceptions/auth_exception.dart';
export 'exceptions/profile_exception.dart';

// Repositories
export 'repositories/auth_repository.dart';
export 'repositories/profile_repository.dart';
export 'repositories/mock/mock_auth_repository.dart';
export 'repositories/mock/mock_profile_repository.dart';
export 'repositories/mock/mock_seeds.dart';

// Services
export 'services/auth_service.dart';
export 'services/profile_service.dart';
