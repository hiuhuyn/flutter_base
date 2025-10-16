# Kiến trúc dự án Flutter Base

## Tổng quan

Dự án Flutter Base được xây dựng theo **Clean Architecture** với các nguyên tắc:

- **Separation of Concerns** - Tách biệt rõ ràng các layer
- **Dependency Inversion** - Core không phụ thuộc vào UI
- **Single Responsibility** - Mỗi class có một nhiệm vụ duy nhất
- **Testability** - Dễ dàng test từng component riêng biệt

## Kiến trúc tổng thể

```
┌─────────────────────────────────────────────────────────────┐
│                        Presentation Layer                   │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │    Pages    │  │   Widgets   │  │    BLoC     │         │
│  │             │  │             │  │             │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────┐
│                        Domain Layer                         │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │  Services   │  │ Repositories│  │   Models    │         │
│  │             │  │             │  │             │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────┐
│                         Data Layer                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │ API Services│  │  Local DB   │  │   Cache     │         │
│  │             │  │             │  │             │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
└─────────────────────────────────────────────────────────────┘
```

## Cấu trúc thư mục chi tiết

### 1. Core Layer (`lib/core/`)

Core layer chứa các thành phần cơ bản được sử dụng xuyên suốt ứng dụng:

```
core/
├── api/                    # API layer
│   ├── api_constants.dart      # API endpoints, status codes
│   ├── api_service_factory.dart # Factory pattern cho API services
│   ├── base_api_service.dart   # Base class với CRUD operations
│   └── user_api_service.dart   # Example API service
├── bloc/                   # Global BLoCs
│   └── locale/                 # Locale management
├── config/                 # App configuration
│   ├── app_config.dart         # App settings và constants
│   ├── app_routes.dart         # Navigation configuration
│   └── app_theme.dart          # Theme configuration
├── constants/              # App constants
│   └── app_constants.dart      # Global constants
├── exceptions/             # Custom exceptions
│   ├── api_exception.dart      # API-related exceptions
│   ├── network_exception.dart  # Network-related exceptions
│   └── server_exception.dart   # Server-related exceptions
├── models/                 # Data models (Freezed)
├── network/                # Network layer
│   └── api_client.dart         # Dio HTTP client
├── repositories/           # Data repositories
│   ├── base_repository.dart    # Base repository class
│   └── user_repository.dart    # Example repository
├── services/               # Business services
│   ├── locale_service.dart     # Locale management service
│   ├── service_locator.dart    # Dependency injection
│   └── user_service.dart       # User business logic
├── socket/                 # WebSocket client
│   ├── socket_client.dart      # WebSocket implementation
│   ├── socket_service_factory.dart # Socket service factory
│   ├── socket_models.dart      # Socket message models
│   └── socket_example.dart     # Usage examples
└── utils/                  # Utility functions
    └── responsive_utils.dart   # Responsive design utilities
```

### 2. Features Layer (`lib/features/`)

Features layer chứa các tính năng cụ thể của ứng dụng:

```
features/
├── auth/                   # Authentication feature
│   ├── bloc/                   # Auth BLoC
│   │   ├── auth_bloc.dart      # Main auth BLoC
│   │   ├── auth_event.dart     # Auth events
│   │   └── auth_state.dart     # Auth states
│   └── login_page.dart         # Login UI
└── home/                   # Home feature
    ├── bloc/                   # Home BLoC
    │   ├── home_bloc.dart      # Main home BLoC
    │   ├── home_event.dart     # Home events
    │   └── home_state.dart     # Home states
    └── home_page.dart          # Home UI
```

### 3. Shared Layer (`lib/shared/`)

Shared layer chứa các component có thể tái sử dụng:

```
shared/
└── widgets/               # Reusable widgets
    ├── app_button.dart        # Custom button widget
    ├── app_text_field.dart    # Custom text field
    ├── app_loading.dart       # Loading indicator
    ├── app_error_state.dart   # Error state widget
    ├── app_empty_state.dart   # Empty state widget
    ├── app_list_tile.dart     # Custom list tile
    ├── app_card.dart          # Custom card widget
    ├── responsive_layout.dart # Responsive layout wrapper
    └── widgets.dart           # Widget exports
```

### 4. Localization (`lib/l10n/`)

```
l10n/
├── app_localizations.dart     # Main localization class
├── app_localizations_en.dart  # English translations
└── app_localizations_vi.dart  # Vietnamese translations
```

## Data Flow

### 1. API Request Flow

```
UI (Page) → BLoC (Event) → Repository → API Service → HTTP Client → Server
    ↑                                                                    ↓
    ← BLoC (State) ← Repository ← API Service ← HTTP Client ← Response ←
```

### 2. State Management Flow

```
User Action → BLoC Event → Business Logic → Repository → Data Source
     ↑                                                          ↓
UI Update ← BLoC State ← Business Logic ← Repository ← Data Response
```

## Dependency Injection

Dự án sử dụng **GetIt** cho dependency injection:

```dart
// lib/core/services/service_locator.dart
final GetIt serviceLocator = GetIt.instance;

Future<void> initializeServices() async {
  // Register services
  serviceLocator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  serviceLocator.registerSingleton<Dio>(Dio());
  serviceLocator.registerSingleton<ApiClient>(ApiClient());
  serviceLocator.registerSingleton<UserApiService>(
    UserApiService(serviceLocator<ApiClient>()),
  );
  // ... other services
}
```

## State Management với BLoC

### BLoC Pattern

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│    Event    │───▶│    BLoC     │───▶│    State    │
│             │    │             │    │             │
└─────────────┘    └─────────────┘    └─────────────┘
                           │
                           ▼
                   ┌─────────────┐
                   │ Repository  │
                   │             │
                   └─────────────┘
```

### Event Structure

```dart
// Example: Product Events
abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadProducts extends ProductEvent {
  final int page;
  final int perPage;
  final String? search;

  const LoadProducts({
    this.page = 1,
    this.perPage = 20,
    this.search,
  });

  @override
  List<Object?> get props => [page, perPage, search];
}
```

### State Structure

```dart
// Example: Product States
@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(ProductStatus.initial) ProductStatus status,
    @Default([]) List<ProductModel> products,
    ProductModel? selectedProduct,
    @Default(1) int currentPage,
    @Default(false) bool hasReachedMax,
    String? searchQuery,
    String? error,
  }) = _ProductState;
}

enum ProductStatus { initial, loading, success, failure }
```

## Error Handling Strategy

### Exception Hierarchy

```
Exception
├── ApiException (400-499 status codes)
├── NetworkException (Connection issues)
└── ServerException (500+ status codes)
```

### Error Handling Flow

```dart
try {
  final result = await repository.getData();
  emit(SuccessState(result));
} on NetworkException catch (e) {
  emit(ErrorState('Network error: ${e.message}'));
} on ApiException catch (e) {
  emit(ErrorState('API error: ${e.message}'));
} on ServerException catch (e) {
  emit(ErrorState('Server error: ${e.message}'));
} catch (e) {
  emit(ErrorState('Unexpected error: $e'));
}
```

## API Architecture

### HTTP Client Setup

```dart
class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: ApiTimeouts.connectTimeout,
      receiveTimeout: ApiTimeouts.receiveTimeout,
    ));

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      LogInterceptor(),           // Request/Response logging
      AuthInterceptor(),          // Authentication
      ErrorInterceptor(),         // Error handling
      RetryInterceptor(),         // Retry logic
    ]);
  }
}
```

### Base API Service

```dart
abstract class BaseApiService {
  final ApiClient _apiClient;

  BaseApiService(this._apiClient);

  Future<T> get<T>(String endpoint, {
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    // Common GET implementation
  }

  Future<T> post<T>(String endpoint, {
    dynamic data,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    // Common POST implementation
  }

  // ... other HTTP methods
}
```

## WebSocket Architecture

### Socket Client

```dart
class SocketClient {
  WebSocketChannel? _channel;
  StreamController<Map<String, dynamic>> _messageController;

  Future<void> connect(String url, {String? authToken}) async {
    _channel = WebSocketChannel.connect(
      Uri.parse(url),
      protocols: ['chat', 'notifications'],
    );

    // Setup message handling
    _channel!.stream.listen(_handleMessage);
  }

  void _handleMessage(dynamic message) {
    final data = jsonDecode(message);
    _messageController.add(data);
  }
}
```

## Testing Strategy

### Test Structure

```
test/
├── unit/                    # Unit tests
│   ├── bloc/                   # BLoC tests
│   ├── repository/             # Repository tests
│   └── service/                # Service tests
├── widget/                 # Widget tests
│   ├── pages/                  # Page tests
│   └── widgets/                # Widget tests
└── integration/            # Integration tests
    └── app_test.dart           # Full app tests
```

### Example BLoC Test

```dart
void main() {
  group('ProductBloc', () {
    late ProductBloc productBloc;
    late MockProductRepository mockRepository;

    setUp(() {
      mockRepository = MockProductRepository();
      productBloc = ProductBloc(productRepository: mockRepository);
    });

    test('initial state is ProductInitial', () {
      expect(productBloc.state, equals(ProductState.initial()));
    });

    blocTest<ProductBloc, ProductState>(
      'emits [loading, success] when LoadProducts succeeds',
      build: () {
        when(() => mockRepository.getProducts())
            .thenAnswer((_) async => [mockProduct]);
        return productBloc;
      },
      act: (bloc) => bloc.add(const LoadProducts()),
      expect: () => [
        ProductState(status: ProductStatus.loading),
        ProductState(
          status: ProductStatus.success,
          products: [mockProduct],
        ),
      ],
    );
  });
}
```

## Performance Considerations

### 1. Lazy Loading

```dart
// Lazy initialization of heavy services
class ServiceLocator {
  static late final ApiClient _apiClient;

  static ApiClient get apiClient {
    _apiClient ??= ApiClient();
    return _apiClient;
  }
}
```

### 2. Memory Management

```dart
// Proper disposal in BLoCs
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  @override
  Future<void> close() {
    // Clean up resources
    return super.close();
  }
}
```

### 3. Image Optimization

```dart
// Cached network images
CachedNetworkImage(
  imageUrl: product.imageUrl,
  placeholder: (context, url) => const CircularProgressIndicator(),
  errorWidget: (context, url, error) => const Icon(Icons.error),
  memCacheWidth: 200, // Resize for memory efficiency
)
```

## Security Best Practices

### 1. API Security

```dart
// Secure token storage
class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future<void> storeToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }
}
```

### 2. Input Validation

```dart
// Form validation
class ProductFormValidator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }
}
```

## Deployment Architecture

### Build Configurations

```yaml
# android/app/build.gradle
android {
buildTypes {
debug {
applicationIdSuffix ".debug"
debuggable true
}
release {
minifyEnabled true
proguardFiles getDefaultProguardFile('proguard-android.txt')
}
}
}
```

### Environment Configuration

```dart
// lib/core/config/environment.dart
enum Environment { development, staging, production }

class EnvironmentConfig {
  static const Environment _environment = Environment.development;

  static String get baseUrl {
    switch (_environment) {
      case Environment.development:
        return 'https://dev-api.example.com';
      case Environment.staging:
        return 'https://staging-api.example.com';
      case Environment.production:
        return 'https://api.example.com';
    }
  }
}
```

## Monitoring & Analytics

### Logging Strategy

```dart
// lib/core/log.dart
class AppLogger {
  static void debug(String message) {
    if (kDebugMode) {
      print('[DEBUG] $message');
    }
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    print('[ERROR] $message');
    if (error != null) {
      print('Error: $error');
    }
    if (stackTrace != null) {
      print('Stack trace: $stackTrace');
    }
  }
}
```

## Kết luận

Kiến trúc này cung cấp:

- **Scalability** - Dễ dàng mở rộng thêm features mới
- **Maintainability** - Code dễ bảo trì và debug
- **Testability** - Dễ dàng viết unit tests và integration tests
- **Reusability** - Components có thể tái sử dụng
- **Performance** - Tối ưu hóa memory và network usage
- **Security** - Bảo mật dữ liệu và API calls

Việc tuân thủ kiến trúc này sẽ giúp team phát triển hiệu quả và sản phẩm chất lượng cao.
