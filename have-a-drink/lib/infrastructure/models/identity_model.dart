import 'package:have_a_drink/domain/entity/identity.dart';

class IdentityModel extends Identity {
  IdentityModel(String uid, String email, List<String> favouritesArticles)
      : super(uid, email, favouritesArticles);

  factory IdentityModel.fromFirestore(String uid, Map<String, dynamic> data) {
    return IdentityModel(
      uid,
      data['email'] ?? '-',
      ((data['favouritesArticles'] ?? []) as List).cast<String>(),
    );
  }
}

extension Model on Identity {
  Map<String, dynamic> toMap() {
    return {'email': email, 'favouritesArticles': favouritesArticles};
  }
}
