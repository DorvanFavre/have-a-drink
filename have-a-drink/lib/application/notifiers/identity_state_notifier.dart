import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/entity/auth_state.dart';
import 'package:have_a_drink/domain/entity/identity.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/domain/repository/identity_repository.dart';

import 'auth_state_notifier.dart';

class IdentityStateNotifier extends StateNotifier<IdentityState> {
  final IdentityRepository identityRepository;
  final AuthStateNotifier authStateNotifier;

  IdentityStateNotifier(this.identityRepository, this.authStateNotifier)
      : super(NoIdentity()) {
    _removeListener = authStateNotifier.addListener((authState) async {
      if (authState is NoUserLoggedIn) {
        state = NoIdentity();
      } else if (authState is UserLoggedIn) {
        Result result = Failure();
        bool loop = true;
        do {
          await identityRepository
              .getIdentity(authState.authUser.id)
              .then((res) async {
            result = res;
            print('identity_state_notifier: $res');
            if (res is Success<Identity>) {
              state = res.data ?? NoIdentity();
              loop = false;
            }
            await Future.delayed(Duration(seconds: 1));
            print('identity_state_notifier: llop: $loop');
          });
        } while (loop);
      }
    });
  }

  Future<Result> toggleFavorite(Article article) {
    if (state is Identity) {
      final identity = (state as Identity);

      var articles = List<String>.from(identity.favouritesArticles);
      if (identity.favouritesArticles.contains(article.docId)) {
        articles.remove(article.docId);
      } else {
        articles.add(article.docId);
      }
      final newIdentity = identity.copyWith(favouritesArticles: articles);
      state = newIdentity;
      return identityRepository.setIdentity(newIdentity);
    } else
      return Future.value(Failure(message: 'No user identified'));
  }

  Function _removeListener = () {};

  @override
  void dispose() {
    print('identity state notifier : dispose');
    _removeListener();
    super.dispose();
  }
}
