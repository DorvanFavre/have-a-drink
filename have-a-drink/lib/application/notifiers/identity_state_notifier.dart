import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    removeListener = authStateNotifier.addListener((authState) async{
      if (authState is NoUserLoggedIn) {
        state = NoIdentity();
      } else if (authState is UserLoggedIn) {
        Result result = Failure();
        do  {
        await identityRepository.getIdentity(authState.authUser.id).then((res) async {
          result = res;
          print('identity_state_notifier: $res');
          if (res is Success<Identity>) {
            state = res.data ?? NoIdentity();
          }
          await Future.delayed(Duration(seconds: 1));
        });
        } while (result == Failure());
      }
    });
  }

  Function removeListener = () {};

  @override
  void dispose() {
    print('identity state notifier : dispose');
    removeListener();
    super.dispose();
  }
}
