class AppConstants {
  // Routes
  static const String login = '/login';
  static const String home = '/home';

  // API Endpoints
  static const String apiBaseUrl = 'https://api.example.com/v1';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String profileEndpoint = '/user/profile';
  static const String settingsEndpoint = '/user/settings';

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';

  // Validation
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 50;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 20;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Image
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageExtensions = [
    'jpg',
    'jpeg',
    'png',
    'gif',
  ];

  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 10);

  // Error Messages
  static const String networkError = 'Lỗi kết nối mạng';
  static const String serverError = 'Lỗi máy chủ';
  static const String unknownError = 'Lỗi không xác định';
  static const String invalidCredentials = 'Thông tin đăng nhập không hợp lệ';
  static const String userNotFound = 'Không tìm thấy người dùng';

  // Success Messages
  static const String loginSuccess = 'Đăng nhập thành công';
  static const String registerSuccess = 'Đăng ký thành công';
  static const String updateSuccess = 'Cập nhật thành công';
  static const String deleteSuccess = 'Xóa thành công';
}
