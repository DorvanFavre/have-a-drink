

import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/infrastructure/repository/fake_auth_repository.dart';

abstract class AuthRepository{

  factory AuthRepository(){
    return FakeAuthRepository();
  }

  Stream<AuthState> authStateSnapshot();
}