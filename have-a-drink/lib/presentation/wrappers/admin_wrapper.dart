import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/admin_state_provider.dart';

class AdminWrapper extends StatelessWidget {
  final Widget child;

  AdminWrapper({this.child = const SizedBox.shrink()});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final admin = watch(adminStateNotifierProvider);
      return admin ? child : SizedBox.shrink();
    });
  }
}
