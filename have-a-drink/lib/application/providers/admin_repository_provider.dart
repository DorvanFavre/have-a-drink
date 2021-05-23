import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/repository/admin_repository.dart';

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepository();
});
