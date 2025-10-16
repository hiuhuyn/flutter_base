import '../api/user_api_service.dart';

/// User service for business logic
class UserService {
  // ignore: unused_field
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
