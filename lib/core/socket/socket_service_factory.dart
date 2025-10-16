import 'socket_client.dart';
import 'socket_models.dart';

/// Factory for creating and managing socket services
class SocketServiceFactory {
  static SocketClient? _socketClient;
  static String? _baseUrl;
  static String? _authToken;

  /// Get socket client instance
  static SocketClient get socketClient {
    _socketClient ??= SocketClient()..initialize();
    return _socketClient!;
  }

  /// Connect to socket server
  static Future<void> connect(String url, {String? authToken}) async {
    _baseUrl = url;
    _authToken = authToken;
    await socketClient.connect(url, authToken: authToken);
  }

  /// Disconnect from socket server
  static Future<void> disconnect() async {
    await socketClient.disconnect();
  }

  /// Send authentication message
  static Future<void> authenticate(
    String token, {
    String? userId,
    Map<String, dynamic>? metadata,
  }) async {
    final authMessage = SocketAuthMessage(
      token: token,
      userId: userId,
      metadata: metadata,
    );

    await sendMessage(SocketEventType.auth, authMessage.toJson());
  }

  /// Send chat message
  static Future<void> sendChatMessage({
    required String content,
    required String senderId,
    String? senderName,
    String? roomId,
    String? messageId,
    String messageType = 'text',
    Map<String, dynamic>? metadata,
  }) async {
    final chatMessage = SocketChatMessage(
      content: content,
      senderId: senderId,
      senderName: senderName,
      roomId: roomId,
      messageId: messageId,
      messageType: messageType,
      metadata: metadata,
    );

    await sendMessage(SocketEventType.message, chatMessage.toJson());
  }

  /// Send typing indicator
  static Future<void> sendTypingIndicator({
    required String userId,
    required String roomId,
    required bool isTyping,
    String? userName,
  }) async {
    final typingMessage = SocketTypingMessage(
      userId: userId,
      roomId: roomId,
      isTyping: isTyping,
      userName: userName,
    );

    await sendMessage(SocketEventType.typing, typingMessage.toJson());
  }

  /// Join room
  static Future<void> joinRoom({
    required String roomId,
    required String userId,
    String? roomName,
    Map<String, dynamic>? metadata,
  }) async {
    final roomMessage = SocketRoomMessage(
      roomId: roomId,
      userId: userId,
      roomName: roomName,
      metadata: metadata,
    );

    await sendMessage(SocketEventType.join, roomMessage.toJson());
  }

  /// Leave room
  static Future<void> leaveRoom({
    required String roomId,
    required String userId,
    String? roomName,
    Map<String, dynamic>? metadata,
  }) async {
    final roomMessage = SocketRoomMessage(
      roomId: roomId,
      userId: userId,
      roomName: roomName,
      metadata: metadata,
    );

    await sendMessage(SocketEventType.leave, roomMessage.toJson());
  }

  /// Send generic message
  static Future<void> sendMessage(
    String type,
    Map<String, dynamic> data,
  ) async {
    final message = SocketMessage(
      type: type,
      data: data,
      timestamp: DateTime.now().millisecondsSinceEpoch,
    );

    await socketClient.sendMessage(message.toJson());
  }

  /// Set authentication token
  static void setAuthToken(String token) {
    _authToken = token;
    socketClient.setAuthToken(token);
  }

  /// Clear authentication token
  static void clearAuthToken() {
    _authToken = null;
    socketClient.clearAuthToken();
  }

  /// Update socket URL
  static void updateUrl(String newUrl) {
    _baseUrl = newUrl;
    socketClient.updateUrl(newUrl);
  }

  /// Get message stream
  static Stream<Map<String, dynamic>> get messageStream =>
      socketClient.messageStream;

  /// Get connection state stream
  static Stream<SocketConnectionState> get connectionStateStream =>
      socketClient.connectionStateStream;

  /// Check if connected
  static bool get isConnected => socketClient.isConnected;

  /// Get current connection state
  static SocketConnectionState get connectionState =>
      socketClient.connectionState;

  /// Reset socket client (useful for testing)
  static void reset() {
    _socketClient?.dispose();
    _socketClient = null;
    _baseUrl = null;
    _authToken = null;
  }

  /// Dispose resources
  static void dispose() {
    _socketClient?.dispose();
    _socketClient = null;
  }
}
