import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import '../log.dart';
import '../exceptions/socket_exception.dart';

/// Base WebSocket client for handling real-time communication
class SocketClient {
  static const Duration _defaultReconnectInterval = Duration(seconds: 5);
  static const int _defaultMaxReconnectAttempts = 5;
  static const Duration _defaultConnectionTimeout = Duration(seconds: 10);

  WebSocketChannel? _channel;
  String? _url;
  String? _authToken;
  bool _isConnected = false;
  bool _isConnecting = false;
  int _reconnectAttempts = 0;
  Timer? _reconnectTimer;
  Timer? _heartbeatTimer;
  StreamController<Map<String, dynamic>>? _messageController;
  StreamController<SocketConnectionState>? _connectionStateController;

  // Configuration
  Duration reconnectInterval = _defaultReconnectInterval;
  int maxReconnectAttempts = _defaultMaxReconnectAttempts;
  Duration connectionTimeout = _defaultConnectionTimeout;
  bool enableHeartbeat = true;
  Duration heartbeatInterval = const Duration(seconds: 30);

  /// Stream of incoming messages
  Stream<Map<String, dynamic>> get messageStream =>
      _messageController?.stream ?? const Stream.empty();

  /// Stream of connection state changes
  Stream<SocketConnectionState> get connectionStateStream =>
      _connectionStateController?.stream ?? const Stream.empty();

  /// Current connection state
  SocketConnectionState get connectionState {
    if (_isConnecting) return SocketConnectionState.connecting;
    if (_isConnected) return SocketConnectionState.connected;
    return SocketConnectionState.disconnected;
  }

  /// Check if socket is connected
  bool get isConnected => _isConnected;

  /// Initialize the socket client
  void initialize() {
    _messageController = StreamController<Map<String, dynamic>>.broadcast();
    _connectionStateController =
        StreamController<SocketConnectionState>.broadcast();
  }

  /// Connect to WebSocket server
  Future<void> connect(String url, {String? authToken}) async {
    if (_isConnecting || _isConnected) {
      debugLog('[Socket] Already connecting or connected');
      return;
    }

    _url = url;
    _authToken = authToken;
    _isConnecting = true;
    _updateConnectionState();

    try {
      debugLog('[Socket] Connecting to: $url');

      // Add auth token to URL if provided
      final connectionUrl = _buildConnectionUrl(url, authToken);

      _channel = WebSocketChannel.connect(
        Uri.parse(connectionUrl),
        protocols: ['chat', 'superchat'],
      );

      // Set up connection timeout
      final timeoutTimer = Timer(connectionTimeout, () {
        if (_isConnecting) {
          debugLog('[Socket] Connection timeout');
          _handleConnectionError('Connection timeout');
        }
      });

      // Listen to connection
      _channel!.stream.listen(
        _handleMessage,
        onError: _handleConnectionError,
        onDone: _handleConnectionClosed,
        cancelOnError: false,
      );

      // Wait for connection to be established
      await _waitForConnection();
      timeoutTimer.cancel();

      _isConnecting = false;
      _isConnected = true;
      _reconnectAttempts = 0;
      _updateConnectionState();

      debugLog('[Socket] Connected successfully');

      // Start heartbeat if enabled
      if (enableHeartbeat) {
        _startHeartbeat();
      }
    } catch (e) {
      _isConnecting = false;
      _updateConnectionState();
      debugLog('[Socket] Connection failed: $e');
      _handleConnectionError(e.toString());
    }
  }

  /// Disconnect from WebSocket server
  Future<void> disconnect() async {
    debugLog('[Socket] Disconnecting...');

    _stopHeartbeat();
    _stopReconnectTimer();

    if (_channel != null) {
      await _channel!.sink.close(status.goingAway);
      _channel = null;
    }

    _isConnected = false;
    _isConnecting = false;
    _updateConnectionState();

    debugLog('[Socket] Disconnected');
  }

  /// Send message to server
  Future<void> sendMessage(Map<String, dynamic> message) async {
    if (!_isConnected || _channel == null) {
      throw const SocketNotConnectedException('Socket is not connected');
    }

    try {
      final jsonMessage = jsonEncode(message);
      _channel!.sink.add(jsonMessage);
      debugLog('[Socket] Sent: $jsonMessage');
    } catch (e) {
      debugLog('[Socket] Failed to send message: $e');
      throw SocketSendException('Failed to send message: $e');
    }
  }

  /// Send ping message
  Future<void> ping() async {
    await sendMessage({
      'type': 'ping',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  /// Set authentication token
  void setAuthToken(String token) {
    _authToken = token;
    debugLog('[Socket] Auth token updated');
  }

  /// Clear authentication token
  void clearAuthToken() {
    _authToken = null;
    debugLog('[Socket] Auth token cleared');
  }

  /// Update connection URL
  void updateUrl(String newUrl) {
    _url = newUrl;
    debugLog('[Socket] URL updated to: $newUrl');
  }

  /// Handle incoming messages
  void _handleMessage(dynamic data) {
    try {
      if (data is String) {
        final message = jsonDecode(data) as Map<String, dynamic>;
        debugLog('[Socket] Received: $message');
        _messageController?.add(message);
      }
    } catch (e) {
      debugLog('[Socket] Failed to parse message: $e');
    }
  }

  /// Handle connection errors
  void _handleConnectionError(dynamic error) {
    debugLog('[Socket] Connection error: $error');

    _isConnecting = false;
    _isConnected = false;
    _updateConnectionState();

    if (_reconnectAttempts < maxReconnectAttempts && _url != null) {
      _scheduleReconnect();
    } else {
      debugLog('[Socket] Max reconnect attempts reached');
      _messageController?.addError(
        SocketConnectionException('Connection failed: $error'),
      );
    }
  }

  /// Handle connection closed
  void _handleConnectionClosed() {
    debugLog('[Socket] Connection closed');

    _isConnecting = false;
    _isConnected = false;
    _updateConnectionState();

    if (_reconnectAttempts < maxReconnectAttempts && _url != null) {
      _scheduleReconnect();
    }
  }

  /// Wait for connection to be established
  Future<void> _waitForConnection() async {
    // Simple wait - in real implementation, you might want to wait for a specific message
    await Future.delayed(const Duration(milliseconds: 500));
  }

  /// Schedule reconnection
  void _scheduleReconnect() {
    _reconnectAttempts++;
    debugLog(
      '[Socket] Scheduling reconnect attempt $_reconnectAttempts/$maxReconnectAttempts',
    );

    _reconnectTimer = Timer(reconnectInterval, () {
      if (_url != null) {
        connect(_url!, authToken: _authToken);
      }
    });
  }

  /// Stop reconnect timer
  void _stopReconnectTimer() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
  }

  /// Start heartbeat
  void _startHeartbeat() {
    _stopHeartbeat();
    _heartbeatTimer = Timer.periodic(heartbeatInterval, (_) {
      if (_isConnected) {
        ping();
      }
    });
  }

  /// Stop heartbeat
  void _stopHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
  }

  /// Update connection state
  void _updateConnectionState() {
    _connectionStateController?.add(connectionState);
  }

  /// Build connection URL with auth token
  String _buildConnectionUrl(String url, String? authToken) {
    if (authToken == null) return url;

    final uri = Uri.parse(url);
    final queryParams = Map<String, String>.from(uri.queryParameters);
    queryParams['token'] = authToken;

    return uri.replace(queryParameters: queryParams).toString();
  }

  /// Dispose resources
  void dispose() {
    disconnect();
    _messageController?.close();
    _connectionStateController?.close();
    _stopReconnectTimer();
    _stopHeartbeat();
  }
}

/// Socket connection states
enum SocketConnectionState { disconnected, connecting, connected }
