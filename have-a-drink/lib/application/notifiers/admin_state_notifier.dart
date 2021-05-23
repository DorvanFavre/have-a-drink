import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/auth_state_notifier_provider.dart';
import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/domain/repository/admin_repository.dart';

import 'auth_state_notifier.dart';

class AdminStateNotifier extends StateNotifier<bool> {
  final AdminRepository adminRepository;
  final AuthStateNotifier authStateNotifier;

  AdminStateNotifier(this.adminRepository, this.authStateNotifier)
      : super(false) {
    removeListener = authStateNotifier.addListener((authState) {
      if (authState is NoUserLoggedIn) {
        state = false;
      } else if (authState is UserLoggedIn) {
        adminRepository.isUserAdmin(authState.authUser).then((value) {
          state = value;
        });
      }
    });
  }

  Function removeListener = () {};

  @override
  void dispose() {
    removeListener();
    super.dispose();
  }
}
