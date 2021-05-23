import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/auth_repository_provider.dart';
import 'package:have_a_drink/application/view_models/auth_view_model/auth_view_model.dart';
import 'package:have_a_drink/domain/repository/auth_repository.dart';

final AuthViewModelProvider = Provider<AuthViewModel>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthViewModel(authRepository);
});
