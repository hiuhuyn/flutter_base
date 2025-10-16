import 'base_api_service.dart';

/// User API service
class UserApiService extends BaseApiService {
  UserApiService(super.apiClient);

  // List features: GET/POST/PUT/DELETE
  // Future<List<UserModel>> getUsers() async {
  //   return await getList<UserModel>(
  //     '/users',
  //     fromJson: UserModel.fromJson,
  //   );
  // }

}
