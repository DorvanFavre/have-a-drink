import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/admin_state_provider.dart';
import 'package:have_a_drink/application/providers/identity_state_notifier_provider.dart';
import 'package:have_a_drink/domain/entity/identity.dart';
import 'package:have_a_drink/presentation/screens/auth_view.dart';

class IdentityWrapper {
  final BuildContext context;
  final void Function() run;

  IdentityWrapper(this.context, this.run) {
    final authState = context.read(identityStateNotifierProvider);

    if (authState is NoIdentity) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AuthView()))
          .then((value) {
        if (context.read(identityStateNotifierProvider) is Identity) {
          run();
        }
      });
    } else {
      run();
    }
  }
}
