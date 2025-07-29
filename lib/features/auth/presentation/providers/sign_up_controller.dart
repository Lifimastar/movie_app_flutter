import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:movie_app_flutter/features/auth/presentation/providers/auth_providers.dart';

class SignUpController extends StateNotifier<bool> {
  final AuthRepository _authRepository;

  SignUpController(this._authRepository) : super(false);

  Future<bool> signUp(String email, String password) async {
    state = true;
    try {
      await _authRepository.signUp(email, password);
      state = false;
      return true;
    } catch (e) {
      print(e);
      state = false;
      return false;
    }
  }
}

final signUpControllerProvider = StateNotifierProvider<SignUpController, bool>((
  ref,
) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignUpController(authRepository);
});
