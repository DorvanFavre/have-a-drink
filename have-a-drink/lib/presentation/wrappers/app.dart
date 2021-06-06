import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/auth_state_notifier_provider.dart';
import 'package:have_a_drink/presentation/screens/main_page_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            cardColor: Color(0xffF6F8F9),
            primarySwatch: Colors.yellow,
            iconTheme: IconThemeData(color: Colors.black54),
            textTheme: TextTheme(
                bodyText1: TextStyle(color: Color(0xff9AA6A5)),
                bodyText2: TextStyle(
                    color: Color(0xff9AA6A5),
                    fontSize: 12,
                    fontWeight: FontWeight.w100),
                headline4: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w800))),
        home: Stack(
          children: [
            Scaffold(
                /*floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    downloadFileExample();
                  },
                ),*/
                body: MainPageView()),

            // Watch providers
            Consumer(builder: (context, watch, child) {
              final authState = watch(authStateNotifierProvider);
              print('authState : ' + authState.toString());
              return SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
