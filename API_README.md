# API Documentation

## Tổng quan

Dự án Flutter Base này đã được tích hợp với hệ thống API hoàn chỉnh sử dụng:

- **Dio** - HTTP client mạnh mẽ với interceptors
- **Freezed** - Immutable data models với JSON serialization
- **BLoC** - State management pattern
- **Repository Pattern** - Tách biệt data layer và business logic
- **Service Locator** - Dependency injection với GetIt

## Cấu trúc thư mục

```
lib/
├── core/
│   ├── api/
│   │   ├── api_constants.dart          # API endpoints, status codes, error codes
│   │   ├── api_service_factory.dart    # Factory pattern cho API services
│   │   ├── base_api_service.dart       # Base class với CRUD operations
│   │   └── user_api_service.dart       # User API service example
│   ├── exceptions/
│   │   ├── api_exception.dart          # Base API exception
│   │   ├── network_exception.dart      # Network-related exceptions
│   │   └── server_exception.dart       # Server-related exceptions
│   ├── models/                         # Data models (Freezed)
│   ├── network/
│   │   └── api_client.dart             # Dio HTTP client với error handling
│   ├── repositories/
│   │   ├── base_repository.dart        # Base repository class
│   │   └── user_repository.dart        # User repository example
│   └── services/
│       ├── service_locator.dart        # Dependency injection setup
│       └── user_service.dart           # Business logic services
└── features/
    ├── auth/                           # Authentication feature
    │   ├── bloc/                       # Auth BLoC
    │   └── login_page.dart             # Login UI
    └── home/                           # Home feature
        ├── bloc/                       # Home BLoC
        └── home_page.dart              # Home UI
```

## Cách sử dụng

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
    String? description,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
```

**Lưu ý**: Sau khi tạo model, chạy lệnh generate code:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### 2. Tạo API Service

```dart
// lib/core/api/product_api_service.dart
import '../models/product_model.dart';
import '../network/api_client.dart';
import 'api_constants.dart';
import 'base_api_service.dart';

class ProductApiService extends BaseApiService {
  ProductApiService(super.apiClient);

  /// Lấy danh sách sản phẩm với pagination
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int perPage = 20,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'per_page': perPage,
    };

    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }

    return await getList<ProductModel>(
      '/products',
      queryParameters: queryParams,
      fromJson: ProductModel.fromJson,
      dataKey: 'data', // Nếu API trả về {data: [...], meta: {...}}
    );
  }

  /// Lấy chi tiết sản phẩm theo ID
  Future<ProductModel> getProductById(int id) async {
    return await get<ProductModel>(
      '/products/$id',
      fromJson: ProductModel.fromJson,
    );
  }

  /// Tạo sản phẩm mới
  Future<ProductModel> createProduct(ProductModel product) async {
    return await post<ProductModel>(
      '/products',
      data: product.toJson(),
      fromJson: ProductModel.fromJson,
    );
  }

  /// Cập nhật sản phẩm
  Future<ProductModel> updateProduct(int id, ProductModel product) async {
    return await put<ProductModel>(
      '/products/$id',
      data: product.toJson(),
      fromJson: ProductModel.fromJson,
    );
  }

  /// Xóa sản phẩm
  Future<void> deleteProduct(int id) async {
    await delete<void>(
      '/products/$id',
      fromJson: (json) => null,
    );
  }

  /// Upload hình ảnh sản phẩm
  Future<String> uploadProductImage(int productId, String imagePath) async {
    final response = await apiClient.uploadFile(
      '/products/$productId/images',
      imagePath,
      fieldName: 'image',
    );

    return response.data['image_url'] as String;
  }
}
```

### 3. Tạo Repository

```dart
// lib/core/repositories/product_repository.dart
import '../api/product_api_service.dart';
import '../exceptions/api_exception.dart';
import '../exceptions/network_exception.dart';
import '../exceptions/server_exception.dart';
import '../models/product_model.dart';
import 'base_repository.dart';

class ProductRepository extends BaseRepository {
  final ProductApiService _productApiService;

  ProductRepository(this._productApiService);

  /// Lấy danh sách sản phẩm
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int perPage = 20,
    String? search,
  }) async {
    return await handleApiCall(
      () => _productApiService.getProducts(
        page: page,
        perPage: perPage,
        search: search,
      ),
      'Failed to get products',
    );
  }

  /// Lấy chi tiết sản phẩm
  Future<ProductModel> getProductById(int id) async {
    return await handleApiCall(
      () => _productApiService.getProductById(id),
      'Failed to get product details',
    );
  }

  /// Tạo sản phẩm mới
  Future<ProductModel> createProduct(ProductModel product) async {
    return await handleApiCall(
      () => _productApiService.createProduct(product),
      'Failed to create product',
    );
  }

  /// Cập nhật sản phẩm
  Future<ProductModel> updateProduct(int id, ProductModel product) async {
    return await handleApiCall(
      () => _productApiService.updateProduct(id, product),
      'Failed to update product',
    );
  }

  /// Xóa sản phẩm
  Future<void> deleteProduct(int id) async {
    return await handleApiCall(
      () => _productApiService.deleteProduct(id),
      'Failed to delete product',
    );
  }

  /// Upload hình ảnh sản phẩm
  Future<String> uploadProductImage(int productId, String imagePath) async {
    return await handleApiCall(
      () => _productApiService.uploadProductImage(productId, imagePath),
      'Failed to upload product image',
    );
  }
}
```

### 4. Tạo BLoC

```dart
// lib/features/product/bloc/product_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/repositories/product_repository.dart';
import '../../core/exceptions/api_exception.dart';
import '../../core/exceptions/network_exception.dart';
import '../../core/exceptions/server_exception.dart';
import '../../core/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(const ProductState()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadProductDetail>(_onLoadProductDetail);
    on<CreateProduct>(_onCreateProduct);
    on<UpdateProduct>(_onUpdateProduct);
    on<DeleteProduct>(_onDeleteProduct);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final products = await _productRepository.getProducts(
        page: event.page,
        perPage: event.perPage,
        search: event.search,
      );

      emit(state.copyWith(
        status: ProductStatus.success,
        products: products,
        currentPage: event.page,
        hasReachedMax: products.length < event.perPage,
        error: null,
      ));
    } on NetworkException catch (e) {
      emit(state.copyWith(
        status: ProductStatus.failure,
        error: 'Network error: ${e.message}',
      ));
    } on ServerException catch (e) {
      emit(state.copyWith(
        status: ProductStatus.failure,
        error: 'Server error: ${e.message}',
      ));
    } on ApiException catch (e) {
      emit(state.copyWith(
        status: ProductStatus.failure,
        error: 'API error: ${e.message}',
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductStatus.failure,
        error: 'An unexpected error occurred: $e',
      ));
    }
  }

  Future<void> _onLoadProductDetail(
    LoadProductDetail event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final product = await _productRepository.getProductById(event.productId);
      emit(state.copyWith(
        status: ProductStatus.success,
        selectedProduct: product,
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
        error: 'Failed to load product details',
      ));
    }
  }

  Future<void> _onCreateProduct(
    CreateProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final newProduct = await _productRepository.createProduct(event.product);
      final updatedProducts = [newProduct, ...state.products];

      emit(state.copyWith(
        status: ProductStatus.success,
        products: updatedProducts,
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
        error: 'Failed to create product',
      ));
    }
  }

  Future<void> _onUpdateProduct(
    UpdateProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final updatedProduct = await _productRepository.updateProduct(
        event.productId,
        event.product,
      );

      final updatedProducts = state.products.map((product) {
        return product.id == event.productId ? updatedProduct : product;
      }).toList();

      emit(state.copyWith(
        status: ProductStatus.success,
        products: updatedProducts,
        selectedProduct: state.selectedProduct?.id == event.productId
            ? updatedProduct
            : state.selectedProduct,
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
        error: 'Failed to update product',
      ));
    }
  }

  Future<void> _onDeleteProduct(
    DeleteProduct event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      await _productRepository.deleteProduct(event.productId);
      final updatedProducts = state.products
          .where((product) => product.id != event.productId)
          .toList();

      emit(state.copyWith(
        status: ProductStatus.success,
        products: updatedProducts,
        selectedProduct: state.selectedProduct?.id == event.productId
            ? null
            : state.selectedProduct,
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
        error: 'Failed to delete product',
      ));
    }
  }

  Future<void> _onSearchProducts(
    SearchProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final products = await _productRepository.getProducts(
        page: 1,
        perPage: 20,
        search: event.query,
      );

      emit(state.copyWith(
        status: ProductStatus.success,
        products: products,
        searchQuery: event.query,
        currentPage: 1,
        hasReachedMax: products.length < 20,
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
        error: 'Failed to search products',
      ));
    }
  }
}
```

### 5. Sử dụng trong UI

```dart
// lib/features/product/pages/product_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/repositories/product_repository.dart';
import '../../core/api/product_api_service.dart';
import '../../core/network/api_client.dart';
import '../../shared/widgets/widgets.dart';
import '../bloc/product_bloc.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        productRepository: ProductRepository(
          ProductApiService(ApiClient()),
        ),
      )..add(const LoadProducts()),
      child: const ProductListView(),
    );
  }
}

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final bloc = context.read<ProductBloc>();
      if (bloc.state.status == ProductStatus.success &&
          !bloc.state.hasReachedMax) {
        bloc.add(LoadProducts(
          page: bloc.state.currentPage + 1,
          perPage: 20,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to create product page
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (query) {
                context.read<ProductBloc>().add(SearchProducts(query));
              },
            ),
          ),

          // Product list
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.status == ProductStatus.loading &&
                    state.products.isEmpty) {
                  return const AppLoading(message: 'Loading products...');
                }

                if (state.status == ProductStatus.failure &&
                    state.products.isEmpty) {
                  return AppErrorState(
                    title: 'Failed to load products',
                    subtitle: state.error,
                    onRetry: () => context.read<ProductBloc>().add(
                      const LoadProducts(),
                    ),
                  );
                }

                if (state.products.isEmpty) {
                  return const AppEmptyState(
                    title: 'No products found',
                    subtitle: 'Try searching for something else',
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<ProductBloc>().add(const LoadProducts());
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: state.products.length +
                        (state.hasReachedMax ? 0 : 1),
                    itemBuilder: (context, index) {
                      if (index >= state.products.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final product = state.products[index];
                      return AppCard(
                        child: AppListTile(
                          title: product.name,
                          subtitle: '\$${product.price.toStringAsFixed(2)}',
                          trailing: PopupMenuButton<String>(
                            onSelected: (value) {
                              switch (value) {
                                case 'edit':
                                  // Navigate to edit page
                                  break;
                                case 'delete':
                                  _showDeleteDialog(context, product);
                                  break;
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit'),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                          onTap: () {
                            context.read<ProductBloc>().add(
                              LoadProductDetail(product.id),
                            );
                            // Navigate to product detail
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, ProductModel product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text('Are you sure you want to delete "${product.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ProductBloc>().add(DeleteProduct(product.id));
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
```

## API Constants

Dự án sử dụng các constants được định nghĩa trong `lib/core/api/api_constants.dart`:

```dart
// Sử dụng API constants
import '../core/api/api_constants.dart';

// Base URLs
ApiEndpoints.baseUrl          // 'https://api.example.com'
ApiEndpoints.stagingUrl       // 'https://staging-api.example.com'
ApiEndpoints.devUrl          // 'https://dev-api.example.com'

// Auth endpoints
ApiEndpoints.login           // '/auth/login'
ApiEndpoints.register        // '/auth/register'
ApiEndpoints.logout          // '/auth/logout'
ApiEndpoints.refreshToken    // '/auth/refresh'

// User endpoints
ApiEndpoints.userProfile     // '/user/profile'
ApiEndpoints.users           // '/users'
ApiEndpoints.userSearch      // '/users/search'

// File upload endpoints
ApiEndpoints.uploadImage     // '/upload/image'
ApiEndpoints.uploadAvatar    // '/upload/avatar'

// Status codes
ApiStatusCodes.success       // 200
ApiStatusCodes.created       // 201
ApiStatusCodes.badRequest    // 400
ApiStatusCodes.unauthorized  // 401
ApiStatusCodes.forbidden     // 403
ApiStatusCodes.notFound      // 404
ApiStatusCodes.serverError   // 500

// Error codes
ApiErrorCodes.validationError    // 'VALIDATION_ERROR'
ApiErrorCodes.authenticationError // 'AUTHENTICATION_ERROR'
ApiErrorCodes.networkError       // 'NETWORK_ERROR'
ApiErrorCodes.serverError        // 'SERVER_ERROR'

// Timeouts
ApiTimeouts.connectTimeout   // Duration(seconds: 30)
ApiTimeouts.receiveTimeout   // Duration(seconds: 30)
ApiTimeouts.sendTimeout      // Duration(seconds: 30)

// Pagination
ApiPagination.defaultPage    // 1
ApiPagination.defaultPerPage // 10
ApiPagination.maxPerPage     // 100

// Headers
ApiHeaders.contentType       // 'Content-Type'
ApiHeaders.authorization     // 'Authorization'
ApiHeaders.accept           // 'Accept'

// Content types
ApiContentTypes.json        // 'application/json'
ApiContentTypes.formData    // 'multipart/form-data'
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
