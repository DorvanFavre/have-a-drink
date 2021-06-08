abstract class IdentityState {}

class NoIdentity extends IdentityState {}

class Identity extends IdentityState {
  final String uid;
  final String email;
  final List<String> favouritesArticles;

  Identity(this.uid, this.email, this.favouritesArticles);

  Identity copyWith(
      {String? uid, String? email, List<String>? favouritesArticles}) {
    return Identity(uid ?? this.uid, email ?? this.email,
        favouritesArticles ?? this.favouritesArticles);
  }
}
