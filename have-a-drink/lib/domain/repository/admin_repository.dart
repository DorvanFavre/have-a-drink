import 'package:have_a_drink/domain/entity/auth_user.dart';
import 'package:have_a_drink/infrastructure/repository/firebase_admin_repository.dart';

abstract class AdminRepository {
  factory AdminRepository() {
    return FirebaseAdminRepository();
  }

  Future<bool> isUserAdmin(AuthUser authUser);
}
