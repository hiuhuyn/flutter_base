import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

import '../../features/auth/login_page.dart';
import '../../features/home/home_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String userProfile = '/user/profile';

  static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      // Auth Routes
      GoRoute(path: login, builder: (context, state) => const LoginPage()),

      // Main Routes
      GoRoute(path: home, builder: (context, state) => const HomePage()),
    ],
    errorBuilder: (context, state) {
      final l10n = AppLocalizations.of(context)!;
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('${l10n.pageNotFound}: ${state.uri}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go(home),
                child: Text(l10n.goHome),
              ),
            ],
          ),
        ),
      );
    },
  );
}
