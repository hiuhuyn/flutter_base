# Socket Client Documentation

## Tổng quan

Socket client được thiết kế để xử lý kết nối WebSocket real-time trong ứng dụng Flutter. Nó cung cấp:

- Kết nối WebSocket với auto-reconnect
- Quản lý authentication
- Heartbeat mechanism
- Message handling với type safety
- Error handling và logging

## Cấu trúc Files

```
lib/core/socket/
├── socket_client.dart           # Base WebSocket client
├── socket_service_factory.dart  # Factory để quản lý socket services
├── socket_models.dart          # Models cho các loại message
├── socket_example.dart         # Ví dụ sử dụng
└── README.md                   # Documentation này
```

## Cách sử dụng

### 1. Khởi tạo kết nối

```dart
import 'package:flutter_base/core/socket/socket_service_factory.dart';

// Kết nối đến WebSocket server
await SocketServiceFactory.connect(
  'wss://your-websocket-server.com/ws',
  authToken: 'your-auth-token',
);
```

### 2. Lắng nghe connection state

```dart
SocketServiceFactory.connectionStateStream.listen((state) {
  switch (state) {
    case SocketConnectionState.connected:
      print('Đã kết nối');
      break;
    case SocketConnectionState.connecting:
      print('Đang kết nối...');
      break;
    case SocketConnectionState.disconnected:
      print('Đã ngắt kết nối');
      break;
  }
});
```

### 3. Lắng nghe messages

```dart
SocketServiceFactory.messageStream.listen((message) {
  final type = message['type'] as String;

  switch (type) {
    case SocketEventType.message:
      // Xử lý chat message
      break;
    case SocketEventType.notification:
      // Xử lý notification
      break;
    case SocketEventType.typing:
      // Xử lý typing indicator
      break;
  }
});
```

### 4. Gửi messages

#### Gửi chat message

```dart
await SocketServiceFactory.sendChatMessage(
  content: 'Hello World!',
  senderId: 'user123',
  senderName: 'John Doe',
  roomId: 'room456',
);
```

#### Gửi typing indicator

```dart
await SocketServiceFactory.sendTypingIndicator(
  userId: 'user123',
  roomId: 'room456',
  isTyping: true,
  userName: 'John Doe',
);
```

#### Join/Leave room

```dart
// Join room
await SocketServiceFactory.joinRoom(
  roomId: 'room456',
  userId: 'user123',
  roomName: 'General Chat',
);

// Leave room
await SocketServiceFactory.leaveRoom(
  roomId: 'room456',
  userId: 'user123',
);
```

#### Gửi custom message

```dart
await SocketServiceFactory.sendMessage('custom_event', {
  'data': 'your custom data',
  'timestamp': DateTime.now().millisecondsSinceEpoch,
});
```

### 5. Authentication

```dart
// Authenticate với server
await SocketServiceFactory.authenticate(
  'your-jwt-token',
  userId: 'user123',
  metadata: {'device': 'mobile'},
);

// Update auth token
SocketServiceFactory.setAuthToken('new-token');

// Clear auth token
SocketServiceFactory.clearAuthToken();
```

### 6. Quản lý kết nối

```dart
// Kiểm tra trạng thái kết nối
bool isConnected = SocketServiceFactory.isConnected;
SocketConnectionState state = SocketServiceFactory.connectionState;

// Ngắt kết nối
await SocketServiceFactory.disconnect();

// Dispose resources
SocketServiceFactory.dispose();
```

## Models

### SocketMessage

Base model cho tất cả socket messages:

```dart
SocketMessage(
  type: 'message',
  data: {'content': 'Hello'},
  id: 'msg123',
  timestamp: 1234567890,
)
```

### SocketChatMessage

Model cho chat messages:

```dart
SocketChatMessage(
  content: 'Hello World!',
  senderId: 'user123',
  senderName: 'John Doe',
  roomId: 'room456',
  messageType: 'text',
)
```

### SocketNotificationMessage

Model cho notifications:

```dart
SocketNotificationMessage(
  title: 'New Message',
  body: 'You have a new message',
  type: 'chat',
  data: {'roomId': 'room456'},
)
```

## Configuration

### SocketClient Configuration

```dart
final socketClient = SocketServiceFactory.socketClient;

// Cấu hình reconnect
socketClient.reconnectInterval = Duration(seconds: 5);
socketClient.maxReconnectAttempts = 10;

// Cấu hình heartbeat
socketClient.enableHeartbeat = true;
socketClient.heartbeatInterval = Duration(seconds: 30);

// Cấu hình timeout
socketClient.connectionTimeout = Duration(seconds: 15);
```

## Error Handling

Socket client tự động xử lý các lỗi phổ biến:

- **Connection timeout**: Tự động reconnect
- **Network errors**: Retry với exponential backoff
- **Authentication errors**: Clear token và reconnect
- **Message parsing errors**: Log và continue

## Best Practices

1. **Luôn dispose resources** khi không sử dụng
2. **Handle connection state** để update UI
3. **Use type-safe models** thay vì raw JSON
4. **Implement proper error handling** cho từng loại message
5. **Test với network interruptions** để đảm bảo stability

## Testing

```dart
// Reset socket client cho testing
SocketServiceFactory.reset();

// Mock connection state
// Test message handling
// Test reconnection logic
```

## Troubleshooting

### Kết nối không thành công

- Kiểm tra URL WebSocket
- Kiểm tra network connectivity
- Kiểm tra authentication token

### Messages không được gửi

- Kiểm tra connection state
- Kiểm tra message format
- Kiểm tra server logs

### Auto-reconnect không hoạt động

- Kiểm tra maxReconnectAttempts
- Kiểm tra reconnectInterval
- Kiểm tra network stability
