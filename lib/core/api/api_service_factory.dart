import '../network/api_client.dart';
import 'user_api_service.dart';

/// Factory for creating API services
class ApiServiceFactory {
  static final ApiClient _apiClient = ApiClient();

  // Singleton instances
  static UserApiService? _userApiService;

  /// Get API client instance
  static ApiClient get apiClient => _apiClient;

  /// Get User API service
  static UserApiService get userApi =>
      _userApiService ??= UserApiService(_apiClient);

  /// Set authorization token for all API services
  static void setAuthToken(String token) {
    _apiClient.setAuthToken(token);
  }

  /// Clear authorization token for all API services
  static void clearAuthToken() {
    _apiClient.clearAuthToken();
  }

  /// Update base URL for all API services
  static void updateBaseUrl(String newBaseUrl) {
    _apiClient.updateBaseUrl(newBaseUrl);
  }

  /// Reset all singleton instances (useful for testing)
  static void reset() {
    _userApiService = null;
  }
}
