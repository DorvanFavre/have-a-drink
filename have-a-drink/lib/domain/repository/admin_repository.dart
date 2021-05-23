import 'package:have_a_drink/domain/entity/auth_user.dart';
import 'package:have_a_drink/infrastructure/repository/fake_admin_repository.dart';

abstract class AdminRepository {
  factory AdminRepository() {
    return FakeAdminRepository();
  }

  Future<bool> isUserAdmin(AuthUser authUser);
}
