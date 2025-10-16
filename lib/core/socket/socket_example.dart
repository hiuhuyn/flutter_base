import 'package:flutter_base/core/utils/log.dart';

import 'socket_service_factory.dart';
import 'socket_models.dart';

/// Example usage of SocketServiceFactory
class SocketExample {
  /// Initialize socket connection
  static Future<void> initializeSocket() async {
    try {
      // Connect to WebSocket server
      await SocketServiceFactory.connect(
        'wss://your-websocket-server.com/ws',
        authToken: 'your-auth-token',
      );

      // Listen to connection state changes
      SocketServiceFactory.connectionStateStream.listen((state) {
        debugLog('Socket connection state: $state');
      });

      // Listen to incoming messages
      SocketServiceFactory.messageStream.listen((message) {
        _handleIncomingMessage(message);
      });

      // Authenticate with server
      await SocketServiceFactory.authenticate(
        'your-jwt-token',
        userId: 'user123',
        metadata: {'device': 'mobile'},
      );
    } catch (e) {
      debugLog('Failed to initialize socket: $e');
    }
  }

  /// Handle incoming messages
  static void _handleIncomingMessage(Map<String, dynamic> message) {
    final type = message['type'] as String?;

    switch (type) {
      case SocketEventType.message:
        _handleChatMessage(message);
        break;
      case SocketEventType.notification:
        _handleNotification(message);
        break;
      case SocketEventType.typing:
        _handleTypingIndicator(message);
        break;
      case SocketEventType.userOnline:
      case SocketEventType.userOffline:
        _handleUserPresence(message);
        break;
      case SocketEventType.error:
        _handleError(message);
        break;
      default:
        debugLog('Unknown message type: $type');
    }
  }

  /// Handle chat messages
  static void _handleChatMessage(Map<String, dynamic> message) {
    try {
      final data = message['data'] as Map<String, dynamic>;
      final chatMessage = SocketChatMessage.fromJson(data);

      debugLog('Received chat message: ${chatMessage.content}');
      debugLog('From: ${chatMessage.senderName} (${chatMessage.senderId})');
      debugLog('Room: ${chatMessage.roomId}');
    } catch (e) {
      debugLog('Failed to parse chat message: $e');
    }
  }

  /// Handle notifications
  static void _handleNotification(Map<String, dynamic> message) {
    try {
      final data = message['data'] as Map<String, dynamic>;
      final notification = SocketNotificationMessage.fromJson(data);

      debugLog('Received notification: ${notification.title}');
      debugLog('Body: ${notification.body}');
    } catch (e) {
      debugLog('Failed to parse notification: $e');
    }
  }

  /// Handle typing indicators
  static void _handleTypingIndicator(Map<String, dynamic> message) {
    try {
      final data = message['data'] as Map<String, dynamic>;
      final typing = SocketTypingMessage.fromJson(data);

      debugLog(
        'User ${typing.userName} is ${typing.isTyping ? 'typing' : 'not typing'} in room ${typing.roomId}',
      );
    } catch (e) {
      debugLog('Failed to parse typing indicator: $e');
    }
  }

  /// Handle user presence
  static void _handleUserPresence(Map<String, dynamic> message) {
    try {
      final data = message['data'] as Map<String, dynamic>;
      final presence = SocketUserPresenceMessage.fromJson(data);

      debugLog('User ${presence.userName} is now ${presence.status}');
    } catch (e) {
      debugLog('Failed to parse user presence: $e');
    }
  }

  /// Handle errors
  static void _handleError(Map<String, dynamic> message) {
    try {
      final data = message['data'] as Map<String, dynamic>;
      final error = SocketErrorMessage.fromJson(data);

      debugLog('Socket error: ${error.message} (Code: ${error.code})');
    } catch (e) {
      debugLog('Failed to parse error message: $e');
    }
  }

  /// Send a chat message
  static Future<void> sendChatMessage() async {
    try {
      await SocketServiceFactory.sendChatMessage(
        content: 'Hello from Flutter!',
        senderId: 'user123',
        senderName: 'John Doe',
        roomId: 'room456',
        messageType: 'text',
      );
      debugLog('Chat message sent successfully');
    } catch (e) {
      debugLog('Failed to send chat message: $e');
    }
  }

  /// Join a room
  static Future<void> joinRoom() async {
    try {
      await SocketServiceFactory.joinRoom(
        roomId: 'room456',
        userId: 'user123',
        roomName: 'General Chat',
      );
      debugLog('Joined room successfully');
    } catch (e) {
      debugLog('Failed to join room: $e');
    }
  }

  /// Send typing indicator
  static Future<void> sendTypingIndicator(bool isTyping) async {
    try {
      await SocketServiceFactory.sendTypingIndicator(
        userId: 'user123',
        roomId: 'room456',
        isTyping: isTyping,
        userName: 'John Doe',
      );
      debugLog('Typing indicator sent: $isTyping');
    } catch (e) {
      debugLog('Failed to send typing indicator: $e');
    }
  }

  /// Disconnect socket
  static Future<void> disconnect() async {
    try {
      await SocketServiceFactory.disconnect();
      debugLog('Socket disconnected');
    } catch (e) {
      debugLog('Failed to disconnect socket: $e');
    }
  }
}
