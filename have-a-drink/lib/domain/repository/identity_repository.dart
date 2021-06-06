import 'package:have_a_drink/domain/entity/identity.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/infrastructure/repository/fake_identity_repository.dart';
import 'package:have_a_drink/infrastructure/repository/firebase_identity_repository.dart';

abstract class IdentityRepository {
  factory IdentityRepository() {
    return FirebaseIdentityRepository();
  }

  Future<Result<Identity>> getIdentity(String uid);
}
