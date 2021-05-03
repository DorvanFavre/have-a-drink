import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
            Text('Developement in process')
        ],
      )),
          ),
    );
  }
}
