import 'api_exception.dart';

/// Exception for server-related errors (5xx status codes)
class ServerException extends ApiException {
  const ServerException(
    super.message, {
    super.statusCode,
    super.code,
    super.data,
  });

  @override
  String toString() => 'ServerException: $message';
}
