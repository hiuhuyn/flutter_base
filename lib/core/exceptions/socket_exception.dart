import 'api_exception.dart';

/// Base exception for socket-related errors
abstract class SocketException extends ApiException {
  const SocketException(super.message, {super.statusCode});
}

/// Exception thrown when socket is not connected
class SocketNotConnectedException extends SocketException {
  const SocketNotConnectedException(super.message) : super(statusCode: 0);
}

/// Exception thrown when socket connection fails
class SocketConnectionException extends SocketException {
  const SocketConnectionException(super.message) : super(statusCode: 0);
}

/// Exception thrown when socket send operation fails
class SocketSendException extends SocketException {
  const SocketSendException(super.message) : super(statusCode: 0);
}

/// Exception thrown when socket receive operation fails
class SocketReceiveException extends SocketException {
  const SocketReceiveException(super.message) : super(statusCode: 0);
}
