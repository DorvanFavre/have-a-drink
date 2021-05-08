

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/domain/repository/auth_repository.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthStateNotifier(this.authRepository) : super(NoUserLoggedIn()){
    _streamSubscription = authRepository.authStateSnapshot().listen((event) {
      state = event;
    });
  }

  StreamSubscription? _streamSubscription;

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

}