import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/user_api_service.dart';
import '../network/api_client.dart';
import 'locale_service.dart';
import 'user_service.dart';

/// Service Locator để quản lý dependency injection
final GetIt serviceLocator = GetIt.instance;

/// Khởi tạo tất cả các service
Future<void> initializeServices() async {
  // Đăng ký SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);

  // Đăng ký Dio
  serviceLocator.registerSingleton<Dio>(Dio());

  // Đăng ký ApiClient
  serviceLocator.registerSingleton<ApiClient>(
    ApiClient(),
  );

  // Đăng ký UserApiService
  serviceLocator.registerSingleton<UserApiService>(
    UserApiService(serviceLocator<ApiClient>()),
  );

  // Đăng ký UserService
  serviceLocator.registerSingleton<UserService>(
    UserService(serviceLocator<UserApiService>()),
  );

  // Đăng ký LocaleService
  serviceLocator.registerSingleton<LocaleService>(
    LocaleService(sharedPreferences),
  );
}

/// Reset tất cả service (chủ yếu dùng cho testing)
Future<void> resetServices() async {
  await serviceLocator.reset();
}
