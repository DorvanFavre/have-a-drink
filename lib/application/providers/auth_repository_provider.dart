

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/repository/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
    return AuthRepository();
});