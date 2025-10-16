import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../l10n/app_localizations.dart';

import '../../core/constants/app_constants.dart';
import '../../core/config/app_routes.dart';
import '../../core/services/locale_service.dart';
import '../../core/bloc/locale/locale_bloc.dart';
import '../../shared/widgets/widgets.dart';
import 'bloc/home_bloc.dart';
import '../auth/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeDataRequested()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: (locale) {
              context.read<LocaleBloc>().add(LocaleChanged(locale));
            },
            itemBuilder: (context) => LocaleService.supportedLocales
                .map(
                  (locale) => PopupMenuItem<Locale>(
                    value: locale,
                    child: Text(LocaleService.getLanguageName(locale)),
                  ),
                )
                .toList(),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutRequested());
              context.go(AppConstants.login);
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('${l10n.error}: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(HomeDataRequested());
                    },
                    child: Text(l10n.retry),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.home, size: 80, color: Colors.blue),
                const SizedBox(height: 16),
                Text(
                  l10n.helloWorld,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.welcomeMessage,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 32),
                AppButton(
                  text: 'View Profile',
                  onPressed: () => context.go(AppRoutes.userProfile),
                  type: AppButtonType.primary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
