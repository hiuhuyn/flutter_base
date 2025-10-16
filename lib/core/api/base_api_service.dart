import 'package:dio/dio.dart';
import '../exceptions/api_exception.dart';
import '../network/api_client.dart';

/// Base class for all API services
abstract class BaseApiService {
  final ApiClient _apiClient;

  BaseApiService(this._apiClient);

  /// Get API client instance
  ApiClient get apiClient => _apiClient;

  /// GET request
  Future<T> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }

  /// POST request
  Future<T> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }

  /// PUT request
  Future<T> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _apiClient.put<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }

  /// PATCH request
  Future<T> patch<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _apiClient.patch<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }

  /// DELETE request
  Future<T> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _apiClient.delete<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }

  /// GET list request
  Future<List<T>> getList<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required T Function(Map<String, dynamic>) fromJson,
    String? dataKey,
  }) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      final data = response.data!;
      final listData = dataKey != null ? data[dataKey] as List : data as List;

      return listData
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }

  /// POST list request
  Future<List<T>> postList<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    required T Function(Map<String, dynamic>) fromJson,
    String? dataKey,
  }) async {
    try {
      final response = await _apiClient.post<Map<String, dynamic>>(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      final responseData = response.data!;
      final listData = dataKey != null
          ? responseData[dataKey] as List
          : responseData as List;

      return listData
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw e.error as ApiException;
    }
  }
}
