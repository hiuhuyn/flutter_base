import 'package:equatable/equatable.dart';

/// Base exception for API-related errors
class ApiException extends Equatable implements Exception {
  final String message;
  final int? statusCode;
  final String? code;
  final dynamic data;

  const ApiException(this.message, {this.statusCode, this.code, this.data});

  @override
  List<Object?> get props => [message, statusCode, code, data];

  @override
  String toString() =>
      'ApiException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
}
