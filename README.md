# Flutter Base Small

Một Flutter base project hoàn chỉnh với kiến trúc clean architecture, tích hợp đầy đủ các tính năng cần thiết cho việc phát triển ứng dụng mobile hiện đại.

## 🚀 Tính năng chính

### Core Features

- ✅ **Clean Architecture** - Kiến trúc rõ ràng, dễ bảo trì
- ✅ **State Management** - BLoC pattern với flutter_bloc
- ✅ **API Integration** - Dio HTTP client với error handling
- ✅ **WebSocket Support** - Real-time communication
- ✅ **Authentication** - Login/logout với token management
- ✅ **Internationalization** - Hỗ trợ đa ngôn ngữ (Tiếng Việt, English)
- ✅ **Responsive Design** - Tương thích nhiều kích thước màn hình
- ✅ **Theme System** - Light/Dark theme support
- ✅ **Navigation** - GoRouter với type-safe routing
- ✅ **Dependency Injection** - GetIt service locator
- ✅ **Local Storage** - SharedPreferences integration
- ✅ **Code Generation** - Freezed cho immutable models

### UI Components

- ✅ **Shared Widgets** - Thư viện widget tái sử dụng
- ✅ **Loading States** - Loading, error, empty states
- ✅ **Form Validation** - Input validation với error messages
- ✅ **Responsive Layout** - Adaptive layout cho mobile/tablet

## 📋 Yêu cầu hệ thống

- **Flutter SDK**: >= 3.0.0
- **Dart SDK**: >= 3.0.0
- **Android**: API level 21+ (Android 5.0+)
- **iOS**: iOS 11.0+
- **macOS**: macOS 10.14+
- **Windows**: Windows 10+
- **Linux**: Ubuntu 18.04+

## 🛠️ Cài đặt

### 1. Clone repository

```bash
git clone <repository-url>
cd flutter_base
```

### 2. Cài đặt dependencies

```bash
flutter pub get
```

### 3. Generate code (nếu cần)

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 4. Chạy ứng dụng

```bash
# Debug mode
flutter run

# Release mode
flutter run --release

# Chạy trên platform cụ thể
flutter run -d chrome          # Web
flutter run -d windows         # Windows
flutter run -d macos           # macOS
flutter run -d linux           # Linux
```

## 📁 Cấu trúc dự án

```
lib/
├── app.dart                   # App configuration
├── main.dart                  # Entry point
├── core/                      # Core functionality
│   ├── api/                   # API services
│   │   ├── api_constants.dart
│   │   ├── api_service_factory.dart
│   │   ├── base_api_service.dart
│   │   └── user_api_service.dart
│   ├── bloc/                  # Global BLoCs
│   │   └── locale/
│   ├── config/                # App configuration
│   │   ├── app_config.dart
│   │   ├── app_routes.dart
│   │   └── app_theme.dart
│   ├── constants/             # App constants
│   │   └── app_constants.dart
│   ├── exceptions/            # Custom exceptions
│   │   ├── api_exception.dart
│   │   ├── network_exception.dart
│   │   └── server_exception.dart
│   ├── models/                # Data models
│   ├── network/               # Network layer
│   │   └── api_client.dart
│   ├── repositories/          # Data repositories
│   │   ├── base_repository.dart
│   │   └── user_repository.dart
│   ├── services/              # Business services
│   │   ├── locale_service.dart
│   │   ├── service_locator.dart
│   │   └── user_service.dart
│   ├── socket/                # WebSocket client
│   │   ├── socket_client.dart
│   │   ├── socket_service_factory.dart
│   │   ├── socket_models.dart
│   │   └── socket_example.dart
│   └── utils/                 # Utility functions
│       └── responsive_utils.dart
├── features/                  # Feature modules
│   ├── auth/                  # Authentication
│   │   ├── bloc/
│   │   └── login_page.dart
│   └── home/                  # Home feature
│       ├── bloc/
│       └── home_page.dart
├── l10n/                      # Localization
│   ├── app_localizations.dart
│   ├── app_localizations_en.dart
│   └── app_localizations_vi.dart
└── shared/                    # Shared components
    └── widgets/               # Reusable widgets
        ├── app_button.dart
        ├── app_text_field.dart
        ├── app_loading.dart
        ├── app_error_state.dart
        ├── app_empty_state.dart
        ├── app_list_tile.dart
        ├── app_card.dart
        ├── responsive_layout.dart
        └── widgets.dart
```

## 🔧 Cấu hình

### API Configuration

Cập nhật API endpoints trong `lib/core/config/app_config.dart`:

```dart
class AppConfig {
  static const String baseUrl = 'https://your-api.com';
  static const Duration apiTimeout = Duration(seconds: 30);
  // ... other configs
}
```

### Theme Configuration

Tùy chỉnh theme trong `lib/core/config/app_theme.dart`:

```dart
class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    primarySwatch: Colors.blue,
    // ... theme configs
  );
}
```

### Routes Configuration

Thêm routes mới trong `lib/core/config/app_routes.dart`:

```dart
class AppRoutes {
  static const String newRoute = '/new-route';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: newRoute,
        builder: (context, state) => const NewPage()
      ),
    ],
  );
}
```

## 📱 Sử dụng

### 1. Tạo Model mới

```dart
// lib/core/models/product_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String name,
    required double price,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
```

### 2. Tạo API Service

```dart
// lib/core/api/product_api_service.dart
class ProductApiService extends BaseApiService {
  ProductApiService(super.apiClient);

  Future<List<ProductModel>> getProducts() async {
    return await getList<ProductModel>(
      '/products',
      fromJson: ProductModel.fromJson,
    );
  }
}
```

### 3. Tạo BLoC

```dart
// lib/features/product/bloc/product_bloc.dart
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    // ... business logic
  }
}
```

### 4. Sử dụng trong UI

```dart
// lib/features/product/pages/product_page.dart
class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(LoadProducts()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const AppLoading();
          }
          // ... other states
        },
      ),
    );
  }
}
```

## 🌐 Internationalization

### Thêm ngôn ngữ mới

1. Tạo file `assets/l10n/app_[locale].arb`
2. Thêm locale vào `LocaleService.supportedLocales`
3. Chạy `flutter gen-l10n`

### Sử dụng trong code

```dart
final l10n = AppLocalizations.of(context)!;
Text(l10n.helloWorld)
```

## 🔌 WebSocket

### Kết nối WebSocket

```dart
await SocketServiceFactory.connect(
  'wss://your-websocket-server.com/ws',
  authToken: 'your-auth-token',
);
```

### Lắng nghe messages

```dart
SocketServiceFactory.messageStream.listen((message) {
  // Handle incoming messages
});
```

### Gửi messages

```dart
await SocketServiceFactory.sendMessage({
  'type': 'chat',
  'content': 'Hello World',
});
```

## 🧪 Testing

### Chạy tests

```bash
# Unit tests
flutter test

# Integration tests
flutter test integration_test/

# Coverage
flutter test --coverage
```

### Test structure

```
test/
├── unit/                      # Unit tests
├── widget/                    # Widget tests
└── integration/               # Integration tests
```

## 📦 Build & Deploy

### Android

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle (recommended for Play Store)
flutter build appbundle --release
```

### iOS

```bash
# Debug
flutter build ios --debug

# Release
flutter build ios --release
```

### Web

```bash
# Debug
flutter build web --debug

# Release
flutter build web --release
```

### Desktop

```bash
# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

## 🔧 Development Tools

### Code Generation

```bash
# Generate models, serializers
flutter packages pub run build_runner build

# Watch for changes
flutter packages pub run build_runner watch

# Clean generated files
flutter packages pub run build_runner clean
```

### Linting

```bash
# Check code style
flutter analyze

# Fix auto-fixable issues
dart fix --apply
```

### Formatting

```bash
# Format code
dart format .
```

## 📚 Tài liệu tham khảo

- [API Documentation](API_README.md) - Chi tiết về API integration
- [Socket Documentation](lib/core/socket/README.md) - WebSocket usage
- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Documentation](https://bloclibrary.dev/)
- [GoRouter Documentation](https://pub.dev/packages/go_router)

## 🤝 Đóng góp

1. Fork repository
2. Tạo feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Tạo Pull Request

## 📄 License

Dự án này được phân phối dưới MIT License. Xem file `LICENSE` để biết thêm chi tiết.

## 🆘 Hỗ trợ

Nếu bạn gặp vấn đề hoặc có câu hỏi:

1. Kiểm tra [Issues](https://github.com/your-repo/issues) hiện có
2. Tạo issue mới với mô tả chi tiết
3. Liên hệ team phát triển

---

**Happy Coding! 🎉**
