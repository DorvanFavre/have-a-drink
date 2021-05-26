import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/auth_state_notifier_provider.dart';
import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/presentation/screens/auth_view.dart';

class AuthWrapper {
  final BuildContext context;
  final void Function() run;

  AuthWrapper(this.context, this.run) {
    final authState = context.read(authStateNotifierProvider);

    if (authState is NoUserLoggedIn) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AuthView()))
          .then((value) {
        if (context.read(authStateNotifierProvider) is UserLoggedIn) {
          run();
        }
      });
    } else {
      run();
    }
  }
}
