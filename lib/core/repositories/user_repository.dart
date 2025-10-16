import '../api/api_service_factory.dart';

import '../services/user_service.dart';

/// User repository for handling user-related data operations
class UserRepository {
  // ignore: unused_field
  final UserService _userService;

  UserRepository({UserService? userService})
    : _userService =
          userService ??
          UserService(ApiServiceFactory.userApi);

}
