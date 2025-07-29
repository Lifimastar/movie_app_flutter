import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:movie_app_flutter/features/auth/presentation/providers/auth_providers.dart';

class LoginController extends StateNotifier<bool> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(false);

  Future<bool> signIn(String email, String password) async {
    state = true;
    try {
      await _authRepository.signIn(email, password);
      state = false;
      return true;
    } catch (e) {
      state = false;
      print(e);
      return false;
    }
  }
}

// Provider para el controlador de login
final loginControllerProvider = StateNotifierProvider<LoginController, bool>((
  ref,
) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginController(authRepository);
});
