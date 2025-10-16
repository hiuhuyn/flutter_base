/// API endpoints constants
class ApiEndpoints {
  // Base URLs
  static const String baseUrl = 'https://api.example.com';
  static const String stagingUrl = 'https://staging-api.example.com';
  static const String devUrl = 'https://dev-api.example.com';

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyEmail = '/auth/verify-email';

  // User endpoints
  static const String userProfile = '/user/profile';
  static const String userPreferences = '/user/preferences';
  static const String userAvatar = '/user/avatar';
  static const String userAccount = '/user/account';
  static const String users = '/users';
  static const String userSearch = '/users/search';

  // File upload endpoints
  static const String uploadImage = '/upload/image';
  static const String uploadDocument = '/upload/document';
  static const String uploadAvatar = '/upload/avatar';

  // Notification endpoints
  static const String notifications = '/notifications';
  static const String markNotificationRead = '/notifications/{id}/read';
  static const String markAllNotificationsRead = '/notifications/read-all';

  // Settings endpoints
  static const String appSettings = '/settings/app';
  static const String userSettings = '/settings/user';
}

/// API response status codes
class ApiStatusCodes {
  static const int success = 200;
  static const int created = 201;
  static const int noContent = 204;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int unprocessableEntity = 422;
  static const int tooManyRequests = 429;
  static const int internalServerError = 500;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
}

/// API error codes
class ApiErrorCodes {
  static const String validationError = 'VALIDATION_ERROR';
  static const String authenticationError = 'AUTHENTICATION_ERROR';
  static const String authorizationError = 'AUTHORIZATION_ERROR';
  static const String notFoundError = 'NOT_FOUND_ERROR';
  static const String conflictError = 'CONFLICT_ERROR';
  static const String rateLimitError = 'RATE_LIMIT_ERROR';
  static const String serverError = 'SERVER_ERROR';
  static const String networkError = 'NETWORK_ERROR';
  static const String timeoutError = 'TIMEOUT_ERROR';
}

/// API request timeouts
class ApiTimeouts {
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
}

/// API pagination constants
class ApiPagination {
  static const int defaultPage = 1;
  static const int defaultPerPage = 10;
  static const int maxPerPage = 100;
  static const int minPerPage = 1;
}

/// API headers
class ApiHeaders {
  static const String contentType = 'Content-Type';
  static const String authorization = 'Authorization';
  static const String accept = 'Accept';
  static const String userAgent = 'User-Agent';
  static const String apiVersion = 'X-API-Version';
  static const String requestId = 'X-Request-ID';
  static const String timestamp = 'X-Timestamp';
}

/// API content types
class ApiContentTypes {
  static const String json = 'application/json';
  static const String formData = 'multipart/form-data';
  static const String urlEncoded = 'application/x-www-form-urlencoded';
  static const String text = 'text/plain';
  static const String html = 'text/html';
}
