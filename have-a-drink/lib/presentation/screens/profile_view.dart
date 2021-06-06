import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/auth_state_notifier_provider.dart';
import 'package:have_a_drink/application/providers/authviewmodel_provider.dart';
import 'package:have_a_drink/application/providers/identity_state_notifier_provider.dart';
import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/domain/entity/identity.dart';

import 'auth_view.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read(authViewModelProvider);

    return Consumer(
      builder: (context, watch, child) {
        final authState = watch(authStateNotifierProvider);

        return Stack(
          children: [
            // auth
            Padding(
              padding: EdgeInsets.all(30),
              child: Align(
                alignment: Alignment.topRight,
                child: authState is UserLoggedIn
                    ? IconButton(
                        onPressed: () {
                          authViewModel.logout();
                        },
                        icon: Icon(Icons.logout))
                    : SizedBox.shrink(),
              ),
            ),

            // identity
            child ?? SizedBox.shrink()
          ],
        );
      },
      child: Consumer(
        builder: (context, watch, child) {
          final identity = watch(identityStateNotifierProvider);

          if (identity is Identity) {
            return Stack(
              children: [
                Container(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(identity.email),
                        SizedBox(height: 50),
                        TextButton(
                            onPressed: () {
                              authViewModel.logout();
                            },
                            child: Text('logout')),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else
            return Center(
              child: Text('No user logged in'),
            );
        },
      ),
    );
  }
}
