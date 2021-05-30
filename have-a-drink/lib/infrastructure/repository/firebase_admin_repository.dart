import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:have_a_drink/domain/entity/auth_user.dart';
import 'package:have_a_drink/domain/repository/admin_repository.dart';

class FirebaseAdminRepository implements AdminRepository {
  final String kCollection = 'admin';

  @override
  Future<bool> isUserAdmin(AuthUser authUser) {
    return FirebaseFirestore.instance
        .collection(kCollection)
        .doc(authUser.id)
        .get()
        .then((snap) => snap.exists);
  }
}
