import 'package:firebase_auth/firebase_auth.dart';
import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/domain/entity/auth_user.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/domain/repository/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  @override
  Stream<AuthState> authStateSnapshot() {
    return FirebaseAuth.instance.authStateChanges().map((user) =>
        user == null ? NoUserLoggedIn() : UserLoggedIn(AuthUser(user.uid)));
  }

  @override
  Future<Result> login(String email, String password) {
    return FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Success() as Result)
        .catchError((e) => Failure(message: e.toString()));
  }

  @override
  Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }

  @override
  Future<Result> register(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => Success(data: value) as Result)
        .catchError((e) => Failure(message: e.toString()));
  }
}
