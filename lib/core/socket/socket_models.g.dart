// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocketMessageImpl _$$SocketMessageImplFromJson(Map<String, dynamic> json) =>
    _$SocketMessageImpl(
      type: json['type'] as String,
      data: json['data'] as Map<String, dynamic>,
      id: json['id'] as String?,
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SocketMessageImplToJson(_$SocketMessageImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'id': instance.id,
      'timestamp': instance.timestamp,
    };

_$SocketAuthMessageImpl _$$SocketAuthMessageImplFromJson(
  Map<String, dynamic> json,
) => _$SocketAuthMessageImpl(
  token: json['token'] as String,
  userId: json['userId'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$SocketAuthMessageImplToJson(
  _$SocketAuthMessageImpl instance,
) => <String, dynamic>{
  'token': instance.token,
  'userId': instance.userId,
  'metadata': instance.metadata,
};

_$SocketChatMessageImpl _$$SocketChatMessageImplFromJson(
  Map<String, dynamic> json,
) => _$SocketChatMessageImpl(
  content: json['content'] as String,
  senderId: json['senderId'] as String,
  senderName: json['senderName'] as String?,
  roomId: json['roomId'] as String?,
  messageId: json['messageId'] as String?,
  messageType: json['messageType'] as String? ?? 'text',
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$SocketChatMessageImplToJson(
  _$SocketChatMessageImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'senderId': instance.senderId,
  'senderName': instance.senderName,
  'roomId': instance.roomId,
  'messageId': instance.messageId,
  'messageType': instance.messageType,
  'metadata': instance.metadata,
};

_$SocketNotificationMessageImpl _$$SocketNotificationMessageImplFromJson(
  Map<String, dynamic> json,
) => _$SocketNotificationMessageImpl(
  title: json['title'] as String,
  body: json['body'] as String,
  type: json['type'] as String?,
  data: json['data'] as Map<String, dynamic>?,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$$SocketNotificationMessageImplToJson(
  _$SocketNotificationMessageImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'body': instance.body,
  'type': instance.type,
  'data': instance.data,
  'imageUrl': instance.imageUrl,
};

_$SocketTypingMessageImpl _$$SocketTypingMessageImplFromJson(
  Map<String, dynamic> json,
) => _$SocketTypingMessageImpl(
  userId: json['userId'] as String,
  roomId: json['roomId'] as String,
  isTyping: json['isTyping'] as bool,
  userName: json['userName'] as String?,
);

Map<String, dynamic> _$$SocketTypingMessageImplToJson(
  _$SocketTypingMessageImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'roomId': instance.roomId,
  'isTyping': instance.isTyping,
  'userName': instance.userName,
};

_$SocketUserPresenceMessageImpl _$$SocketUserPresenceMessageImplFromJson(
  Map<String, dynamic> json,
) => _$SocketUserPresenceMessageImpl(
  userId: json['userId'] as String,
  status: json['status'] as String,
  userName: json['userName'] as String?,
  avatar: json['avatar'] as String?,
  lastSeen: (json['lastSeen'] as num?)?.toInt(),
);

Map<String, dynamic> _$$SocketUserPresenceMessageImplToJson(
  _$SocketUserPresenceMessageImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'status': instance.status,
  'userName': instance.userName,
  'avatar': instance.avatar,
  'lastSeen': instance.lastSeen,
};

_$SocketRoomMessageImpl _$$SocketRoomMessageImplFromJson(
  Map<String, dynamic> json,
) => _$SocketRoomMessageImpl(
  roomId: json['roomId'] as String,
  userId: json['userId'] as String,
  roomName: json['roomName'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$SocketRoomMessageImplToJson(
  _$SocketRoomMessageImpl instance,
) => <String, dynamic>{
  'roomId': instance.roomId,
  'userId': instance.userId,
  'roomName': instance.roomName,
  'metadata': instance.metadata,
};

_$SocketErrorMessageImpl _$$SocketErrorMessageImplFromJson(
  Map<String, dynamic> json,
) => _$SocketErrorMessageImpl(
  code: json['code'] as String,
  message: json['message'] as String,
  details: json['details'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$SocketErrorMessageImplToJson(
  _$SocketErrorMessageImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'details': instance.details,
};
