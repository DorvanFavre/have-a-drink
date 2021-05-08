import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/auth_state__stream_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
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
            Consumer(builder: (context, watch, child){
              final authState = watch(authStateStreamProvider);
              print(authState.toString());
              return Text(authState.toString());
            })
          ],
        )),
      ),
    );
  }
}
