import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:have_a_drink/domain/entity/identity.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/domain/repository/identity_repository.dart';
import 'package:have_a_drink/infrastructure/models/identity_model.dart';

class FirebaseIdentityRepository implements IdentityRepository {
  @override
  Future<Result<Identity>> getIdentity(String uid) {
    return FirebaseFirestore.instance
        .collection('identities')
        .doc(uid)
        .get()
        .then((snap) =>
            Success(data: IdentityModel.fromFirestore(uid, snap.data() ?? {}))
                as Result<Identity>)
        .catchError((e) => Failure<Identity>(message: e));
  }
}
