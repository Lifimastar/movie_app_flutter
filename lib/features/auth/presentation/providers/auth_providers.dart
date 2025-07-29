import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/features/auth/data/datasources/auth_data_source.dart';
import 'package:movie_app_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Provider para el DataSource
final authDataSourceProvider = Provider<AuthDataSource>((ref) {
  return AuthDataSource();
});

// Provider para el Repositorio
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authDataSource = ref.watch(authDataSourceProvider);
  return AuthRepository(authDataSource);
});

// Provider para escuchar el estado de la autenticacion entiempo real
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});
