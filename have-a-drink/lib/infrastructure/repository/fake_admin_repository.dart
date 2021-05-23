import 'package:have_a_drink/domain/entity/auth_user.dart';
import 'package:have_a_drink/domain/repository/admin_repository.dart';

class FakeAdminRepository implements AdminRepository {
  @override
  Future<bool> isUserAdmin(AuthUser authUser) {
    return Future.delayed(Duration(milliseconds: 100), () => true);
  }
}
