import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:have_a_drink/application/view_models/auth_view_model/auth_view_model.dart';
import 'package:have_a_drink/domain/repository/auth_repository.dart';

class TrueAuthViewModel implements AuthViewModel {
  final AuthRepository authRepository;

  TrueAuthViewModel(this.authRepository);

  @override
  TextEditingController loginEmailController = TextEditingController();

  @override
  TextEditingController loginPasswordController = TextEditingController();

  @override
  TextEditingController registerEmailController = TextEditingController();

  @override
  TextEditingController registerPasswordController = TextEditingController();

  @override
  TextEditingController registerRepeatedPasswordController =
      TextEditingController();

  @override
  void logout() {
    authRepository.logout();
  }

  @override
  void login() {
    final email = loginEmailController.text;
    final password = loginPasswordController.text;

    String? message;
    if (email.trim().isEmpty) {
      message = 'Enter a email please';
    } else if (!email.contains('@')) {
      message = 'Enter a valide email please';
    } else if (password.trim().isEmpty) {
      message = 'Enter a password please';
    }

    if (message != null) {
    } else {
      authRepository.login();
    }
  }

  @override
  void register() {
    final email = registerEmailController.text;
    final password = registerPasswordController.text;
    final repeatePassword = registerRepeatedPasswordController.text;

    String? message = null;
    if (email.trim().isEmpty) {
      message = 'Enter a email please';
    } else if (!email.contains('@')) {
      message = 'Enter a valide email please';
    } else if (password.contains(' ')) {
      message = 'password cannot contain spaces';
    } else if (password.length < 6) {
      message = 'password should be at least 6 character long';
    } else if (password != repeatePassword) {
      message = 'password does not correspond';
    }

    if (message != null) {}

    return authRepository.register();
  }
}
