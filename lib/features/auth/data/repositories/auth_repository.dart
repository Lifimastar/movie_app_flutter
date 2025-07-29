import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_flutter/features/auth/data/datasources/auth_data_source.dart';

class AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepository(this._authDataSource);

  Future<UserCredential> signIn(String email, String password) {
    return _authDataSource.signInWithEmailAndPassword(email, password);
  }

  Future<UserCredential> signUp(String email, String password) {
    return _authDataSource.createUserWithEmailAndPassword(email, password);
  }

  Future<void> signOut() {
    return _authDataSource.signOut();
  }
}
