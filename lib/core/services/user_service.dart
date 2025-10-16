import '../api/user_api_service.dart';
import '../exceptions/api_exception.dart';

/// User service for business logic
class UserService {
  final UserApiService _userApiService;

  UserService(this._userApiService);

  /// Get current user profile with caching
  // Future<UserProfileModel> getCurrentUser() async {
  //   try {
  //     return await _userApiService.getCurrentUser();
  //   } on ApiException {
  //     rethrow;
  //   } catch (e) {
  //     throw ApiException('Failed to get current user: ${e.toString()}');
  //   }
  // }

}
