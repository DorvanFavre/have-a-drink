import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/entity/identity.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/domain/repository/identity_repository.dart';

class FakeIdentityRepository implements IdentityRepository {
  @override
  Future<Result<Identity>> getIdentity(String uid) {
    return Future.delayed(
        Duration(seconds: 1),
        () => Success(
            data: Identity('fake_uid', 'fake@gmail.com', ['1', '2', '3'])));
  }

  @override
  Future<Result> setIdentity(Identity identity) {
    return Future.value(Failure());
  }
}
