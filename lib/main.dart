import 'package:flutter/material.dart';
import 'app.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo tất cả các service
  await initializeServices();

  runApp(const MyApp());
}
