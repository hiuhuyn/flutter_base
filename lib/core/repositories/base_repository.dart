import 'package:flutter_base/core/network/api_client.dart';

abstract class BaseRepository {
  final ApiClient _apiClient;

  BaseRepository(this._apiClient);

  ApiClient get apiClient => _apiClient;
 
}
