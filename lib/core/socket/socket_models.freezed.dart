// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'socket_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SocketMessage _$SocketMessageFromJson(Map<String, dynamic> json) {
  return _SocketMessage.fromJson(json);
}

/// @nodoc
mixin _$SocketMessage {
  String get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;

  /// Serializes this SocketMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocketMessageCopyWith<SocketMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketMessageCopyWith<$Res> {
  factory $SocketMessageCopyWith(
    SocketMessage value,
    $Res Function(SocketMessage) then,
  ) = _$SocketMessageCopyWithImpl<$Res, SocketMessage>;
  @useResult
  $Res call({
    String type,
    Map<String, dynamic> data,
    String? id,
    int timestamp,
  });
}

/// @nodoc
class _$SocketMessageCopyWithImpl<$Res, $Val extends SocketMessage>
    implements $SocketMessageCopyWith<$Res> {
  _$SocketMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? data = null,
    Object? id = freezed,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocketMessageImplCopyWith<$Res>
    implements $SocketMessageCopyWith<$Res> {
  factory _$$SocketMessageImplCopyWith(
    _$SocketMessageImpl value,
    $Res Function(_$SocketMessageImpl) then,
  ) = __$$SocketMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    Map<String, dynamic> data,
    String? id,
    int timestamp,
  });
}

/// @nodoc
class __$$SocketMessageImplCopyWithImpl<$Res>
    extends _$SocketMessageCopyWithImpl<$Res, _$SocketMessageImpl>
    implements _$$SocketMessageImplCopyWith<$Res> {
  __$$SocketMessageImplCopyWithImpl(
    _$SocketMessageImpl _value,
    $Res Function(_$SocketMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? data = null,
    Object? id = freezed,
    Object? timestamp = null,
  }) {
    return _then(
      _$SocketMessageImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocketMessageImpl implements _SocketMessage {
  const _$SocketMessageImpl({
    required this.type,
    required final Map<String, dynamic> data,
    this.id,
    this.timestamp = 0,
  }) : _data = data;

  factory _$SocketMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocketMessageImplFromJson(json);

  @override
  final String type;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final String? id;
  @override
  @JsonKey()
  final int timestamp;

  @override
  String toString() {
    return 'SocketMessage(type: $type, data: $data, id: $id, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketMessageImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    const DeepCollectionEquality().hash(_data),
    id,
    timestamp,
  );

  /// Create a copy of SocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketMessageImplCopyWith<_$SocketMessageImpl> get copyWith =>
      __$$SocketMessageImplCopyWithImpl<_$SocketMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocketMessageImplToJson(this);
  }
}

abstract class _SocketMessage implements SocketMessage {
  const factory _SocketMessage({
    required final String type,
    required final Map<String, dynamic> data,
    final String? id,
    final int timestamp,
  }) = _$SocketMessageImpl;

  factory _SocketMessage.fromJson(Map<String, dynamic> json) =
      _$SocketMessageImpl.fromJson;

  @override
  String get type;
  @override
  Map<String, dynamic> get data;
  @override
  String? get id;
  @override
  int get timestamp;

  /// Create a copy of SocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketMessageImplCopyWith<_$SocketMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocketAuthMessage _$SocketAuthMessageFromJson(Map<String, dynamic> json) {
  return _SocketAuthMessage.fromJson(json);
}

/// @nodoc
mixin _$SocketAuthMessage {
  String get token => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this SocketAuthMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocketAuthMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocketAuthMessageCopyWith<SocketAuthMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketAuthMessageCopyWith<$Res> {
  factory $SocketAuthMessageCopyWith(
    SocketAuthMessage value,
    $Res Function(SocketAuthMessage) then,
  ) = _$SocketAuthMessageCopyWithImpl<$Res, SocketAuthMessage>;
  @useResult
  $Res call({String token, String? userId, Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SocketAuthMessageCopyWithImpl<$Res, $Val extends SocketAuthMessage>
    implements $SocketAuthMessageCopyWith<$Res> {
  _$SocketAuthMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketAuthMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? userId = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocketAuthMessageImplCopyWith<$Res>
    implements $SocketAuthMessageCopyWith<$Res> {
  factory _$$SocketAuthMessageImplCopyWith(
    _$SocketAuthMessageImpl value,
    $Res Function(_$SocketAuthMessageImpl) then,
  ) = __$$SocketAuthMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String? userId, Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SocketAuthMessageImplCopyWithImpl<$Res>
    extends _$SocketAuthMessageCopyWithImpl<$Res, _$SocketAuthMessageImpl>
    implements _$$SocketAuthMessageImplCopyWith<$Res> {
  __$$SocketAuthMessageImplCopyWithImpl(
    _$SocketAuthMessageImpl _value,
    $Res Function(_$SocketAuthMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocketAuthMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? userId = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$SocketAuthMessageImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocketAuthMessageImpl implements _SocketAuthMessage {
  const _$SocketAuthMessageImpl({
    required this.token,
    this.userId,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata;

  factory _$SocketAuthMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocketAuthMessageImplFromJson(json);

  @override
  final String token;
  @override
  final String? userId;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SocketAuthMessage(token: $token, userId: $userId, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketAuthMessageImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    token,
    userId,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of SocketAuthMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketAuthMessageImplCopyWith<_$SocketAuthMessageImpl> get copyWith =>
      __$$SocketAuthMessageImplCopyWithImpl<_$SocketAuthMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SocketAuthMessageImplToJson(this);
  }
}

abstract class _SocketAuthMessage implements SocketAuthMessage {
  const factory _SocketAuthMessage({
    required final String token,
    final String? userId,
    final Map<String, dynamic>? metadata,
  }) = _$SocketAuthMessageImpl;

  factory _SocketAuthMessage.fromJson(Map<String, dynamic> json) =
      _$SocketAuthMessageImpl.fromJson;

  @override
  String get token;
  @override
  String? get userId;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of SocketAuthMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketAuthMessageImplCopyWith<_$SocketAuthMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocketChatMessage _$SocketChatMessageFromJson(Map<String, dynamic> json) {
  return _SocketChatMessage.fromJson(json);
}

/// @nodoc
mixin _$SocketChatMessage {
  String get content => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String? get senderName => throw _privateConstructorUsedError;
  String? get roomId => throw _privateConstructorUsedError;
  String? get messageId => throw _privateConstructorUsedError;
  String get messageType => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this SocketChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocketChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocketChatMessageCopyWith<SocketChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketChatMessageCopyWith<$Res> {
  factory $SocketChatMessageCopyWith(
    SocketChatMessage value,
    $Res Function(SocketChatMessage) then,
  ) = _$SocketChatMessageCopyWithImpl<$Res, SocketChatMessage>;
  @useResult
  $Res call({
    String content,
    String senderId,
    String? senderName,
    String? roomId,
    String? messageId,
    String messageType,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$SocketChatMessageCopyWithImpl<$Res, $Val extends SocketChatMessage>
    implements $SocketChatMessageCopyWith<$Res> {
  _$SocketChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? senderId = null,
    Object? senderName = freezed,
    Object? roomId = freezed,
    Object? messageId = freezed,
    Object? messageType = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String,
            senderName: freezed == senderName
                ? _value.senderName
                : senderName // ignore: cast_nullable_to_non_nullable
                      as String?,
            roomId: freezed == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageId: freezed == messageId
                ? _value.messageId
                : messageId // ignore: cast_nullable_to_non_nullable
                      as String?,
            messageType: null == messageType
                ? _value.messageType
                : messageType // ignore: cast_nullable_to_non_nullable
                      as String,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocketChatMessageImplCopyWith<$Res>
    implements $SocketChatMessageCopyWith<$Res> {
  factory _$$SocketChatMessageImplCopyWith(
    _$SocketChatMessageImpl value,
    $Res Function(_$SocketChatMessageImpl) then,
  ) = __$$SocketChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String content,
    String senderId,
    String? senderName,
    String? roomId,
    String? messageId,
    String messageType,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$SocketChatMessageImplCopyWithImpl<$Res>
    extends _$SocketChatMessageCopyWithImpl<$Res, _$SocketChatMessageImpl>
    implements _$$SocketChatMessageImplCopyWith<$Res> {
  __$$SocketChatMessageImplCopyWithImpl(
    _$SocketChatMessageImpl _value,
    $Res Function(_$SocketChatMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocketChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? senderId = null,
    Object? senderName = freezed,
    Object? roomId = freezed,
    Object? messageId = freezed,
    Object? messageType = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _$SocketChatMessageImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderName: freezed == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roomId: freezed == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageId: freezed == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as String?,
        messageType: null == messageType
            ? _value.messageType
            : messageType // ignore: cast_nullable_to_non_nullable
                  as String,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocketChatMessageImpl implements _SocketChatMessage {
  const _$SocketChatMessageImpl({
    required this.content,
    required this.senderId,
    this.senderName,
    this.roomId,
    this.messageId,
    this.messageType = 'text',
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata;

  factory _$SocketChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocketChatMessageImplFromJson(json);

  @override
  final String content;
  @override
  final String senderId;
  @override
  final String? senderName;
  @override
  final String? roomId;
  @override
  final String? messageId;
  @override
  @JsonKey()
  final String messageType;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SocketChatMessage(content: $content, senderId: $senderId, senderName: $senderName, roomId: $roomId, messageId: $messageId, messageType: $messageType, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketChatMessageImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    content,
    senderId,
    senderName,
    roomId,
    messageId,
    messageType,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of SocketChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketChatMessageImplCopyWith<_$SocketChatMessageImpl> get copyWith =>
      __$$SocketChatMessageImplCopyWithImpl<_$SocketChatMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SocketChatMessageImplToJson(this);
  }
}

abstract class _SocketChatMessage implements SocketChatMessage {
  const factory _SocketChatMessage({
    required final String content,
    required final String senderId,
    final String? senderName,
    final String? roomId,
    final String? messageId,
    final String messageType,
    final Map<String, dynamic>? metadata,
  }) = _$SocketChatMessageImpl;

  factory _SocketChatMessage.fromJson(Map<String, dynamic> json) =
      _$SocketChatMessageImpl.fromJson;

  @override
  String get content;
  @override
  String get senderId;
  @override
  String? get senderName;
  @override
  String? get roomId;
  @override
  String? get messageId;
  @override
  String get messageType;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of SocketChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketChatMessageImplCopyWith<_$SocketChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocketNotificationMessage _$SocketNotificationMessageFromJson(
  Map<String, dynamic> json,
) {
  return _SocketNotificationMessage.fromJson(json);
}

/// @nodoc
mixin _$SocketNotificationMessage {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this SocketNotificationMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocketNotificationMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocketNotificationMessageCopyWith<SocketNotificationMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketNotificationMessageCopyWith<$Res> {
  factory $SocketNotificationMessageCopyWith(
    SocketNotificationMessage value,
    $Res Function(SocketNotificationMessage) then,
  ) = _$SocketNotificationMessageCopyWithImpl<$Res, SocketNotificationMessage>;
  @useResult
  $Res call({
    String title,
    String body,
    String? type,
    Map<String, dynamic>? data,
    String? imageUrl,
  });
}

/// @nodoc
class _$SocketNotificationMessageCopyWithImpl<
  $Res,
  $Val extends SocketNotificationMessage
>
    implements $SocketNotificationMessageCopyWith<$Res> {
  _$SocketNotificationMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketNotificationMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? type = freezed,
    Object? data = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocketNotificationMessageImplCopyWith<$Res>
    implements $SocketNotificationMessageCopyWith<$Res> {
  factory _$$SocketNotificationMessageImplCopyWith(
    _$SocketNotificationMessageImpl value,
    $Res Function(_$SocketNotificationMessageImpl) then,
  ) = __$$SocketNotificationMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String body,
    String? type,
    Map<String, dynamic>? data,
    String? imageUrl,
  });
}

/// @nodoc
class __$$SocketNotificationMessageImplCopyWithImpl<$Res>
    extends
        _$SocketNotificationMessageCopyWithImpl<
          $Res,
          _$SocketNotificationMessageImpl
        >
    implements _$$SocketNotificationMessageImplCopyWith<$Res> {
  __$$SocketNotificationMessageImplCopyWithImpl(
    _$SocketNotificationMessageImpl _value,
    $Res Function(_$SocketNotificationMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocketNotificationMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? type = freezed,
    Object? data = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$SocketNotificationMessageImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        data: freezed == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocketNotificationMessageImpl implements _SocketNotificationMessage {
  const _$SocketNotificationMessageImpl({
    required this.title,
    required this.body,
    this.type,
    final Map<String, dynamic>? data,
    this.imageUrl,
  }) : _data = data;

  factory _$SocketNotificationMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocketNotificationMessageImplFromJson(json);

  @override
  final String title;
  @override
  final String body;
  @override
  final String? type;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'SocketNotificationMessage(title: $title, body: $body, type: $type, data: $data, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketNotificationMessageImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    body,
    type,
    const DeepCollectionEquality().hash(_data),
    imageUrl,
  );

  /// Create a copy of SocketNotificationMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketNotificationMessageImplCopyWith<_$SocketNotificationMessageImpl>
  get copyWith =>
      __$$SocketNotificationMessageImplCopyWithImpl<
        _$SocketNotificationMessageImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocketNotificationMessageImplToJson(this);
  }
}

abstract class _SocketNotificationMessage implements SocketNotificationMessage {
  const factory _SocketNotificationMessage({
    required final String title,
    required final String body,
    final String? type,
    final Map<String, dynamic>? data,
    final String? imageUrl,
  }) = _$SocketNotificationMessageImpl;

  factory _SocketNotificationMessage.fromJson(Map<String, dynamic> json) =
      _$SocketNotificationMessageImpl.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  String? get type;
  @override
  Map<String, dynamic>? get data;
  @override
  String? get imageUrl;

  /// Create a copy of SocketNotificationMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketNotificationMessageImplCopyWith<_$SocketNotificationMessageImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SocketTypingMessage _$SocketTypingMessageFromJson(Map<String, dynamic> json) {
  return _SocketTypingMessage.fromJson(json);
}

/// @nodoc
mixin _$SocketTypingMessage {
  String get userId => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;
  bool get isTyping => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;

  /// Serializes this SocketTypingMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocketTypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocketTypingMessageCopyWith<SocketTypingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketTypingMessageCopyWith<$Res> {
  factory $SocketTypingMessageCopyWith(
    SocketTypingMessage value,
    $Res Function(SocketTypingMessage) then,
  ) = _$SocketTypingMessageCopyWithImpl<$Res, SocketTypingMessage>;
  @useResult
  $Res call({String userId, String roomId, bool isTyping, String? userName});
}

/// @nodoc
class _$SocketTypingMessageCopyWithImpl<$Res, $Val extends SocketTypingMessage>
    implements $SocketTypingMessageCopyWith<$Res> {
  _$SocketTypingMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketTypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roomId = null,
    Object? isTyping = null,
    Object? userName = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String,
            isTyping: null == isTyping
                ? _value.isTyping
                : isTyping // ignore: cast_nullable_to_non_nullable
                      as bool,
            userName: freezed == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocketTypingMessageImplCopyWith<$Res>
    implements $SocketTypingMessageCopyWith<$Res> {
  factory _$$SocketTypingMessageImplCopyWith(
    _$SocketTypingMessageImpl value,
    $Res Function(_$SocketTypingMessageImpl) then,
  ) = __$$SocketTypingMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String roomId, bool isTyping, String? userName});
}

/// @nodoc
class __$$SocketTypingMessageImplCopyWithImpl<$Res>
    extends _$SocketTypingMessageCopyWithImpl<$Res, _$SocketTypingMessageImpl>
    implements _$$SocketTypingMessageImplCopyWith<$Res> {
  __$$SocketTypingMessageImplCopyWithImpl(
    _$SocketTypingMessageImpl _value,
    $Res Function(_$SocketTypingMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocketTypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roomId = null,
    Object? isTyping = null,
    Object? userName = freezed,
  }) {
    return _then(
      _$SocketTypingMessageImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        isTyping: null == isTyping
            ? _value.isTyping
            : isTyping // ignore: cast_nullable_to_non_nullable
                  as bool,
        userName: freezed == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocketTypingMessageImpl implements _SocketTypingMessage {
  const _$SocketTypingMessageImpl({
    required this.userId,
    required this.roomId,
    required this.isTyping,
    this.userName,
  });

  factory _$SocketTypingMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocketTypingMessageImplFromJson(json);

  @override
  final String userId;
  @override
  final String roomId;
  @override
  final bool isTyping;
  @override
  final String? userName;

  @override
  String toString() {
    return 'SocketTypingMessage(userId: $userId, roomId: $roomId, isTyping: $isTyping, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketTypingMessageImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.isTyping, isTyping) ||
                other.isTyping == isTyping) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, roomId, isTyping, userName);

  /// Create a copy of SocketTypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketTypingMessageImplCopyWith<_$SocketTypingMessageImpl> get copyWith =>
      __$$SocketTypingMessageImplCopyWithImpl<_$SocketTypingMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SocketTypingMessageImplToJson(this);
  }
}

abstract class _SocketTypingMessage implements SocketTypingMessage {
  const factory _SocketTypingMessage({
    required final String userId,
    required final String roomId,
    required final bool isTyping,
    final String? userName,
  }) = _$SocketTypingMessageImpl;

  factory _SocketTypingMessage.fromJson(Map<String, dynamic> json) =
      _$SocketTypingMessageImpl.fromJson;

  @override
  String get userId;
  @override
  String get roomId;
  @override
  bool get isTyping;
  @override
  String? get userName;

  /// Create a copy of SocketTypingMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketTypingMessageImplCopyWith<_$SocketTypingMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocketUserPresenceMessage _$SocketUserPresenceMessageFromJson(
  Map<String, dynamic> json,
) {
  return _SocketUserPresenceMessage.fromJson(json);
}

/// @nodoc
mixin _$SocketUserPresenceMessage {
  String get userId => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // online, offline, away, busy
  String? get userName => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get lastSeen => throw _privateConstructorUsedError;

  /// Serializes this SocketUserPresenceMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocketUserPresenceMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocketUserPresenceMessageCopyWith<SocketUserPresenceMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketUserPresenceMessageCopyWith<$Res> {
  factory $SocketUserPresenceMessageCopyWith(
    SocketUserPresenceMessage value,
    $Res Function(SocketUserPresenceMessage) then,
  ) = _$SocketUserPresenceMessageCopyWithImpl<$Res, SocketUserPresenceMessage>;
  @useResult
  $Res call({
    String userId,
    String status,
    String? userName,
    String? avatar,
    int? lastSeen,
  });
}

/// @nodoc
class _$SocketUserPresenceMessageCopyWithImpl<
  $Res,
  $Val extends SocketUserPresenceMessage
>
    implements $SocketUserPresenceMessageCopyWith<$Res> {
  _$SocketUserPresenceMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketUserPresenceMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
    Object? userName = freezed,
    Object? avatar = freezed,
    Object? lastSeen = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            userName: freezed == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastSeen: freezed == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocketUserPresenceMessageImplCopyWith<$Res>
    implements $SocketUserPresenceMessageCopyWith<$Res> {
  factory _$$SocketUserPresenceMessageImplCopyWith(
    _$SocketUserPresenceMessageImpl value,
    $Res Function(_$SocketUserPresenceMessageImpl) then,
  ) = __$$SocketUserPresenceMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    String status,
    String? userName,
    String? avatar,
    int? lastSeen,
  });
}

/// @nodoc
class __$$SocketUserPresenceMessageImplCopyWithImpl<$Res>
    extends
        _$SocketUserPresenceMessageCopyWithImpl<
          $Res,
          _$SocketUserPresenceMessageImpl
        >
    implements _$$SocketUserPresenceMessageImplCopyWith<$Res> {
  __$$SocketUserPresenceMessageImplCopyWithImpl(
    _$SocketUserPresenceMessageImpl _value,
    $Res Function(_$SocketUserPresenceMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocketUserPresenceMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
    Object? userName = freezed,
    Object? avatar = freezed,
    Object? lastSeen = freezed,
  }) {
    return _then(
      _$SocketUserPresenceMessageImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        userName: freezed == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastSeen: freezed == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocketUserPresenceMessageImpl implements _SocketUserPresenceMessage {
  const _$SocketUserPresenceMessageImpl({
    required this.userId,
    required this.status,
    this.userName,
    this.avatar,
    this.lastSeen,
  });

  factory _$SocketUserPresenceMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocketUserPresenceMessageImplFromJson(json);

  @override
  final String userId;
  @override
  final String status;
  // online, offline, away, busy
  @override
  final String? userName;
  @override
  final String? avatar;
  @override
  final int? lastSeen;

  @override
  String toString() {
    return 'SocketUserPresenceMessage(userId: $userId, status: $status, userName: $userName, avatar: $avatar, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketUserPresenceMessageImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, status, userName, avatar, lastSeen);

  /// Create a copy of SocketUserPresenceMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketUserPresenceMessageImplCopyWith<_$SocketUserPresenceMessageImpl>
  get copyWith =>
      __$$SocketUserPresenceMessageImplCopyWithImpl<
        _$SocketUserPresenceMessageImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocketUserPresenceMessageImplToJson(this);
  }
}

abstract class _SocketUserPresenceMessage implements SocketUserPresenceMessage {
  const factory _SocketUserPresenceMessage({
    required final String userId,
    required final String status,
    final String? userName,
    final String? avatar,
    final int? lastSeen,
  }) = _$SocketUserPresenceMessageImpl;

  factory _SocketUserPresenceMessage.fromJson(Map<String, dynamic> json) =
      _$SocketUserPresenceMessageImpl.fromJson;

  @override
  String get userId;
  @override
  String get status; // online, offline, away, busy
  @override
  String? get userName;
  @override
  String? get avatar;
  @override
  int? get lastSeen;

  /// Create a copy of SocketUserPresenceMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketUserPresenceMessageImplCopyWith<_$SocketUserPresenceMessageImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SocketRoomMessage _$SocketRoomMessageFromJson(Map<String, dynamic> json) {
  return _SocketRoomMessage.fromJson(json);
}

/// @nodoc
mixin _$SocketRoomMessage {
  String get roomId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get roomName => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this SocketRoomMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocketRoomMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocketRoomMessageCopyWith<SocketRoomMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketRoomMessageCopyWith<$Res> {
  factory $SocketRoomMessageCopyWith(
    SocketRoomMessage value,
    $Res Function(SocketRoomMessage) then,
  ) = _$SocketRoomMessageCopyWithImpl<$Res, SocketRoomMessage>;
  @useResult
  $Res call({
    String roomId,
    String userId,
    String? roomName,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$SocketRoomMessageCopyWithImpl<$Res, $Val extends SocketRoomMessage>
    implements $SocketRoomMessageCopyWith<$Res> {
  _$SocketRoomMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketRoomMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? roomName = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            roomName: freezed == roomName
                ? _value.roomName
                : roomName // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocketRoomMessageImplCopyWith<$Res>
    implements $SocketRoomMessageCopyWith<$Res> {
  factory _$$SocketRoomMessageImplCopyWith(
    _$SocketRoomMessageImpl value,
    $Res Function(_$SocketRoomMessageImpl) then,
  ) = __$$SocketRoomMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String roomId,
    String userId,
    String? roomName,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$SocketRoomMessageImplCopyWithImpl<$Res>
    extends _$SocketRoomMessageCopyWithImpl<$Res, _$SocketRoomMessageImpl>
    implements _$$SocketRoomMessageImplCopyWith<$Res> {
  __$$SocketRoomMessageImplCopyWithImpl(
    _$SocketRoomMessageImpl _value,
    $Res Function(_$SocketRoomMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocketRoomMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? roomName = freezed,
    Object? metadata = freezed,
  }) {
    return _then(
      _$SocketRoomMessageImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        roomName: freezed == roomName
            ? _value.roomName
            : roomName // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocketRoomMessageImpl implements _SocketRoomMessage {
  const _$SocketRoomMessageImpl({
    required this.roomId,
    required this.userId,
    this.roomName,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata;

  factory _$SocketRoomMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocketRoomMessageImplFromJson(json);

  @override
  final String roomId;
  @override
  final String userId;
  @override
  final String? roomName;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SocketRoomMessage(roomId: $roomId, userId: $userId, roomName: $roomName, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketRoomMessageImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomId,
    userId,
    roomName,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of SocketRoomMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketRoomMessageImplCopyWith<_$SocketRoomMessageImpl> get copyWith =>
      __$$SocketRoomMessageImplCopyWithImpl<_$SocketRoomMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SocketRoomMessageImplToJson(this);
  }
}

abstract class _SocketRoomMessage implements SocketRoomMessage {
  const factory _SocketRoomMessage({
    required final String roomId,
    required final String userId,
    final String? roomName,
    final Map<String, dynamic>? metadata,
  }) = _$SocketRoomMessageImpl;

  factory _SocketRoomMessage.fromJson(Map<String, dynamic> json) =
      _$SocketRoomMessageImpl.fromJson;

  @override
  String get roomId;
  @override
  String get userId;
  @override
  String? get roomName;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of SocketRoomMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketRoomMessageImplCopyWith<_$SocketRoomMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SocketErrorMessage _$SocketErrorMessageFromJson(Map<String, dynamic> json) {
  return _SocketErrorMessage.fromJson(json);
}

/// @nodoc
mixin _$SocketErrorMessage {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  /// Serializes this SocketErrorMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocketErrorMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocketErrorMessageCopyWith<SocketErrorMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketErrorMessageCopyWith<$Res> {
  factory $SocketErrorMessageCopyWith(
    SocketErrorMessage value,
    $Res Function(SocketErrorMessage) then,
  ) = _$SocketErrorMessageCopyWithImpl<$Res, SocketErrorMessage>;
  @useResult
  $Res call({String code, String message, Map<String, dynamic>? details});
}

/// @nodoc
class _$SocketErrorMessageCopyWithImpl<$Res, $Val extends SocketErrorMessage>
    implements $SocketErrorMessageCopyWith<$Res> {
  _$SocketErrorMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocketErrorMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            details: freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SocketErrorMessageImplCopyWith<$Res>
    implements $SocketErrorMessageCopyWith<$Res> {
  factory _$$SocketErrorMessageImplCopyWith(
    _$SocketErrorMessageImpl value,
    $Res Function(_$SocketErrorMessageImpl) then,
  ) = __$$SocketErrorMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, Map<String, dynamic>? details});
}

/// @nodoc
class __$$SocketErrorMessageImplCopyWithImpl<$Res>
    extends _$SocketErrorMessageCopyWithImpl<$Res, _$SocketErrorMessageImpl>
    implements _$$SocketErrorMessageImplCopyWith<$Res> {
  __$$SocketErrorMessageImplCopyWithImpl(
    _$SocketErrorMessageImpl _value,
    $Res Function(_$SocketErrorMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SocketErrorMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(
      _$SocketErrorMessageImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value._details
            : details // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SocketErrorMessageImpl implements _SocketErrorMessage {
  const _$SocketErrorMessageImpl({
    required this.code,
    required this.message,
    final Map<String, dynamic>? details,
  }) : _details = details;

  factory _$SocketErrorMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocketErrorMessageImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  final Map<String, dynamic>? _details;
  @override
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SocketErrorMessage(code: $code, message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketErrorMessageImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    message,
    const DeepCollectionEquality().hash(_details),
  );

  /// Create a copy of SocketErrorMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketErrorMessageImplCopyWith<_$SocketErrorMessageImpl> get copyWith =>
      __$$SocketErrorMessageImplCopyWithImpl<_$SocketErrorMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SocketErrorMessageImplToJson(this);
  }
}

abstract class _SocketErrorMessage implements SocketErrorMessage {
  const factory _SocketErrorMessage({
    required final String code,
    required final String message,
    final Map<String, dynamic>? details,
  }) = _$SocketErrorMessageImpl;

  factory _SocketErrorMessage.fromJson(Map<String, dynamic> json) =
      _$SocketErrorMessageImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  Map<String, dynamic>? get details;

  /// Create a copy of SocketErrorMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketErrorMessageImplCopyWith<_$SocketErrorMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
