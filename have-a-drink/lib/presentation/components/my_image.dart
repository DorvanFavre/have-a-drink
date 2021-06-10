import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/storage_repository_provider.dart';
import 'package:have_a_drink/constants/app.dart';

class MyImage extends StatelessWidget {
  final String path;

  MyImage({this.path = 'wine.jpg'});

  @override
  Widget build(BuildContext context) {
    return Image.asset(kImagePath + path);

    // From Stroage
    return FutureBuilder<String>(
        future: context.read(storageRepositoryProvider).getDownloadUrl(path),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.data != null) {
              try{
              return Image.network(snap.data!);
              } catch (e) {
                print('my image : $e');
              }
              return Container(
                color: Colors.yellow,

              );
            } else {
              return Container(
                color: Colors.red,
              );
            }
          } else
            return Container(
              color: Colors.green,
            );
        });
  }
}
