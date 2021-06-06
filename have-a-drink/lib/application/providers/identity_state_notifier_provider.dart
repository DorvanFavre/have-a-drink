import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/notifiers/identity_state_notifier.dart';
import 'package:have_a_drink/application/providers/auth_state_notifier_provider.dart';
import 'package:have_a_drink/application/providers/identitiy_repository_provider.dart';
import 'package:have_a_drink/domain/entity/identity.dart';

final identityStateNotifierProvider =
    StateNotifierProvider<IdentityStateNotifier, IdentityState>((ref) {
  final identityRepository = ref.watch(identityRepositoryProvider);
  final authStateNotifier = ref.watch(authStateNotifierProvider.notifier);

  print('identity state notifier provider');
  return IdentityStateNotifier(identityRepository, authStateNotifier);
});
