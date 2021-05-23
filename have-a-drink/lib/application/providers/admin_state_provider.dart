import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/notifiers/admin_state_notifier.dart';
import 'package:have_a_drink/application/providers/admin_repository_provider.dart';
import 'package:have_a_drink/application/providers/auth_state_notifier_provider.dart';

final adminStateNotifierProvider =
    StateNotifierProvider<AdminStateNotifier, bool>((ref) {
      final adminRepository = ref.watch(adminRepositoryProvider);
  final authStateNotifier = ref.read(authStateNotifierProvider.notifier);

  return AdminStateNotifier(adminRepository, authStateNotifier);
});
