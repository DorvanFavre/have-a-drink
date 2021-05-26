import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/auth_state_notifier_provider.dart';
import 'package:have_a_drink/application/providers/authviewmodel_provider.dart';
import 'package:have_a_drink/domain/entity/auth_state.dart';

import 'auth_view.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read(authViewModelProvider);

    // Push auth view if no user logged in
    return ProviderListener(
      provider: authStateNotifierProvider,
      onChange: (context, authState) {
        if (authState is NoUserLoggedIn) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AuthView()));
        }
      },
      child: Container(
        child: Center(
          child: TextButton(
              onPressed: () {
                authViewModel.logout();
              },
              child: Text('logout')),
        ),
      ),
    );
  }
}
