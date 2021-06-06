abstract class IdentityState {}

class NoIdentity extends IdentityState {}

class Identity extends IdentityState {
  final String uid;
  final String email;
  final List<String> favouritesArticles;

  Identity(this.uid, this.email, this.favouritesArticles);
}
