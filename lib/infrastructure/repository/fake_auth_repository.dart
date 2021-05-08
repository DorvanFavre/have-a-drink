


import 'dart:math';

import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/domain/entity/auth_user.dart';
import 'package:have_a_drink/domain/repository/auth_repository.dart';

class FakeAuthRepository implements AuthRepository{
  @override
  Stream<AuthState> authStateSnapshot() {
    return Stream<AuthState>.periodic(Duration(seconds: 3), (sec){
      return Random().nextBool() ? NoUserLoggedIn() : UserLoggedIn(AuthUser('123'));
    });
  }

}