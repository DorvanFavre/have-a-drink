import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/repository/identity_repository.dart';

final identityRepositoryProvider = Provider<IdentityRepository>((ref) {
  return IdentityRepository();
});
