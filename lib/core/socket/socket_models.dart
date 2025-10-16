import 'package:freezed_annotation/freezed_annotation.dart';

part 'socket_models.freezed.dart';
part 'socket_models.g.dart';

/// Base socket message model
@freezed
class SocketMessage with _$SocketMessage {
  const factory SocketMessage({
    required String type,
    required Map<String, dynamic> data,
    String? id,
    @Default(0) int timestamp,
  }) = _SocketMessage;

  factory SocketMessage.fromJson(Map<String, dynamic> json) =>
      _$SocketMessageFromJson(json);
}

/// Socket event types
class SocketEventType {
  static const String ping = 'ping';
  static const String pong = 'pong';
  static const String auth = 'auth';
  static const String message = 'message';
  static const String notification = 'notification';
  static const String error = 'error';
  static const String join = 'join';
  static const String leave = 'leave';
  static const String typing = 'typing';
  static const String userOnline = 'user_online';
  static const String userOffline = 'user_offline';
}

/// Authentication message
@freezed
class SocketAuthMessage with _$SocketAuthMessage {
  const factory SocketAuthMessage({
    required String token,
    String? userId,
    Map<String, dynamic>? metadata,
  }) = _SocketAuthMessage;

  factory SocketAuthMessage.fromJson(Map<String, dynamic> json) =>
      _$SocketAuthMessageFromJson(json);
}

/// Chat message
@freezed
class SocketChatMessage with _$SocketChatMessage {
  const factory SocketChatMessage({
    required String content,
    required String senderId,
    String? senderName,
    String? roomId,
    String? messageId,
    @Default('text') String messageType,
    Map<String, dynamic>? metadata,
  }) = _SocketChatMessage;

  factory SocketChatMessage.fromJson(Map<String, dynamic> json) =>
      _$SocketChatMessageFromJson(json);
}

/// Notification message
@freezed
class SocketNotificationMessage with _$SocketNotificationMessage {
  const factory SocketNotificationMessage({
    required String title,
    required String body,
    String? type,
    Map<String, dynamic>? data,
    String? imageUrl,
  }) = _SocketNotificationMessage;

  factory SocketNotificationMessage.fromJson(Map<String, dynamic> json) =>
      _$SocketNotificationMessageFromJson(json);
}

/// Typing indicator message
@freezed
class SocketTypingMessage with _$SocketTypingMessage {
  const factory SocketTypingMessage({
    required String userId,
    required String roomId,
    required bool isTyping,
    String? userName,
  }) = _SocketTypingMessage;

  factory SocketTypingMessage.fromJson(Map<String, dynamic> json) =>
      _$SocketTypingMessageFromJson(json);
}

/// User presence message
@freezed
class SocketUserPresenceMessage with _$SocketUserPresenceMessage {
  const factory SocketUserPresenceMessage({
    required String userId,
    required String status, // online, offline, away, busy
    String? userName,
    String? avatar,
    int? lastSeen,
  }) = _SocketUserPresenceMessage;

  factory SocketUserPresenceMessage.fromJson(Map<String, dynamic> json) =>
      _$SocketUserPresenceMessageFromJson(json);
}

/// Room join/leave message
@freezed
class SocketRoomMessage with _$SocketRoomMessage {
  const factory SocketRoomMessage({
    required String roomId,
    required String userId,
    String? roomName,
    Map<String, dynamic>? metadata,
  }) = _SocketRoomMessage;

  factory SocketRoomMessage.fromJson(Map<String, dynamic> json) =>
      _$SocketRoomMessageFromJson(json);
}

/// Error message
@freezed
class SocketErrorMessage with _$SocketErrorMessage {
  const factory SocketErrorMessage({
    required String code,
    required String message,
    Map<String, dynamic>? details,
  }) = _SocketErrorMessage;

  factory SocketErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$SocketErrorMessageFromJson(json);
}
