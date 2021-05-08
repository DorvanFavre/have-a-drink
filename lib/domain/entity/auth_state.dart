


import 'auth_user.dart';

abstract class AuthState{}

class NoUserLoggedIn extends AuthState{}


class UserLoggedIn extends AuthState{
  final AuthUser authUser;

  UserLoggedIn(this.authUser);
}