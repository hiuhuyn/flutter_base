# API Base Documentation

## Tổng quan

Dự án này đã được tích hợp với base API hoàn chỉnh sử dụng:

- **Dio** cho HTTP client
- **Freezed** cho data models
- **BLoC** cho state management
- **Repository pattern** cho data layer

## Cấu trúc thư mục

```
lib/
├── core/
│   ├── api/
│   │   ├── api_constants.dart          # API endpoints và constants
│   │   ├── api_service_factory.dart    # Factory cho API services
│   │   ├── base_api_service.dart       # Base class cho API services
│   │   └── user_api_service.dart       # Example User API service
│   ├── exceptions/
│   │   ├── api_exception.dart          # Base API exception
│   │   ├── network_exception.dart      # Network exception
│   │   └── server_exception.dart       # Server exception
│   ├── models/
│   │   ├── base_model.dart             # Base models với Freezed
│   │   └── user_model.dart             # Example User models
│   ├── network/
│   │   └── api_client.dart             # Dio HTTP client
│   └── repositories/
│       └── user_repository.dart        # Example User repository
└── features/
    └── user/
        └── presentation/
            ├── bloc/
            │   ├── user_bloc.dart      # User BLoC
            │   ├── user_event.dart     # User events
            │   └── user_state.dart     # User states
            └── pages/
                └── user_profile_page.dart # Example User profile page
```

## Cách sử dụng

### 1. Tạo Model mới

```dart
// lib/core/models/product_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'base_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel implements BaseModel {
  const factory ProductModel({
    required int id,
    required String name,
    required double price,
    String? description,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
```

### 2. Tạo API Service

```dart
// lib/core/api/product_api_service.dart
import 'package:dio/dio.dart';
import '../models/product_model.dart';
import '../models/base_model.dart';
import '../network/api_client.dart';
import 'base_api_service.dart';

class ProductApiService extends BaseApiService {
  ProductApiService(super.apiClient);

  Future<List<ProductModel>> getProducts() async {
    return await getList<ProductModel>(
      '/products',
      fromJson: ProductModel.fromJson,
    );
  }

  Future<ProductModel> getProductById(int id) async {
    return await get<ProductModel>(
      '/products/$id',
      fromJson: ProductModel.fromJson,
    );
  }

  Future<ProductModel> createProduct(ProductModel product) async {
    return await post<ProductModel>(
      '/products',
      data: product.toJson(),
      fromJson: ProductModel.fromJson,
    );
  }
}
```

### 3. Tạo Repository

```dart
// lib/core/repositories/product_repository.dart
import '../api/api_service_factory.dart';
import '../api/product_api_service.dart';
import '../exceptions/api_exception.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ProductApiService _productApiService;

  ProductRepository() : _productApiService = ApiServiceFactory.productApi;

  Future<List<ProductModel>> getProducts() async {
    try {
      return await _productApiService.getProducts();
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException('Failed to get products: ${e.toString()}');
    }
  }
}
```

### 4. Tạo BLoC

```dart
// lib/features/product/presentation/bloc/product_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/repositories/product_repository.dart';
import '../../../../core/exceptions/api_exception.dart';
import '../../../../core/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(const ProductState()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final products = await _productRepository.getProducts();
      emit(state.copyWith(
        status: ProductStatus.success,
        products: products,
        error: null,
      ));
    } on ApiException catch (e) {
      emit(state.copyWith(
        status: ProductStatus.failure,
        error: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductStatus.failure,
        error: 'An unexpected error occurred',
      ));
    }
  }
}
```

### 5. Sử dụng trong UI

```dart
// lib/features/product/presentation/pages/product_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repositories/product_repository.dart';
import '../../../../shared/widgets/widgets.dart';
import '../bloc/product_bloc.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        productRepository: ProductRepository(),
      )..add(const LoadProducts()),
      child: const ProductListView(),
    );
  }
}

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.loading) {
            return const AppLoading(message: 'Loading products...');
          }

          if (state.status == ProductStatus.failure) {
            return AppErrorState(
              title: 'Failed to load products',
              subtitle: state.error,
              onRetry: () => context.read<ProductBloc>().add(const LoadProducts()),
            );
          }

          if (state.products.isEmpty) {
            return const AppEmptyState(
              title: 'No products found',
              subtitle: 'Try again later',
            );
          }

          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return AppListTile(
                title: product.name,
                subtitle: '\$${product.price}',
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to product detail
                },
              );
            },
          );
        },
      ),
    );
  }
}
```

## API Constants

```dart
// Sử dụng API constants
import '../core/api/api_constants.dart';

// Base URLs
ApiEndpoints.baseUrl
ApiEndpoints.stagingUrl
ApiEndpoints.devUrl

// Endpoints
ApiEndpoints.products
ApiEndpoints.users
ApiEndpoints.auth

// Status codes
ApiStatusCodes.success
ApiStatusCodes.badRequest
ApiStatusCodes.unauthorized

// Error codes
ApiErrorCodes.validationError
ApiErrorCodes.networkError
ApiErrorCodes.serverError
```

## Error Handling

```dart
try {
  final products = await productRepository.getProducts();
} on NetworkException catch (e) {
  // Handle network errors (no internet, timeout)
  print('Network error: ${e.message}');
} on ServerException catch (e) {
  // Handle server errors (5xx status codes)
  print('Server error: ${e.message}');
} on ApiException catch (e) {
  // Handle API errors (4xx status codes)
  print('API error: ${e.message} (Status: ${e.statusCode})');
} catch (e) {
  // Handle unexpected errors
  print('Unexpected error: $e');
}
```

## Code Generation

Sau khi tạo models mới, chạy lệnh để generate code:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Lưu ý

1. **Models**: Sử dụng Freezed để tạo immutable models với JSON serialization
2. **API Services**: Extend từ BaseApiService để có sẵn các method CRUD
3. **Repositories**: Wrap API services và handle errors
4. **BLoC**: Quản lý state và business logic
5. **Error Handling**: Sử dụng custom exceptions cho từng loại lỗi
6. **Type Safety**: Tất cả đều type-safe với generic types

## Example Usage

Xem `UserProfilePage` để tham khảo cách sử dụng hoàn chỉnh:

- Load data từ API
- Handle loading, success, error states
- Sử dụng shared widgets
- Error handling với user-friendly messages
