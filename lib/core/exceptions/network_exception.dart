import 'api_exception.dart';

/// Exception for network-related errors (no internet, timeout, etc.)
class NetworkException extends ApiException {
  const NetworkException(
    super.message, {
    super.statusCode,
    super.code,
    super.data,
  });

  @override
  String toString() => 'NetworkException: $message';
}
