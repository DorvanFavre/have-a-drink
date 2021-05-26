import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/infrastructure/repository/fake_auth_repository.dart';
import 'package:have_a_drink/infrastructure/repository/firebase_auth_repository.dart';

abstract class AuthRepository {
  factory AuthRepository() {
    return FirebaseAuthRepository();
  }

  Stream<AuthState> authStateSnapshot();

  Future<Result> login(String email, String password);
  Future<void> logout();
  Future<Result> register(String email, String password);
}
