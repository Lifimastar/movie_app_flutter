import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/features/auth/presentation/providers/auth_providers.dart';
import 'package:movie_app_flutter/features/auth/presentation/screens/login_screen.dart';
import 'package:movie_app_flutter/features/movies/presentation/screens/home_screen.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user != null) {
          return const HomeScreen();
        }
        return const LoginScreen();
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),

      error: (err, stack) =>
          Scaffold(body: Center(child: Text('Error de autenticacion: $err'))),
    );
  }
}
