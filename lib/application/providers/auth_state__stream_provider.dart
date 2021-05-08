import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/notifiers/auth_state_notifier.dart';
import 'package:have_a_drink/domain/entity/auth_state.dart';


import 'auth_repository_provider.dart';

final authStateStreamProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return AuthStateNotifier(authRepository);
});