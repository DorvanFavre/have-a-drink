import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/presentation/screens/app.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Have a drink',
              style: TextStyle(fontSize: 50),
            ),
            // Auth State
            Consumer(builder: (context, watch, child) {
              final authState = watch(authStateNotifierProvider);
              print('authState : ' + authState.toString());
              return Text(authState.toString());
            }),
            // Admin State
            Consumer(builder: (context, watch, child) {
              final adminState = watch(adminStateNotifierProvider);
              print('adminState : ' + adminState.toString());
              return Text(adminState.toString());
            })
          ],
        )),
      ),
    );
  }
}
*/