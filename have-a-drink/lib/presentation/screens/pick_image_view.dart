import 'package:flutter/material.dart';
import 'package:have_a_drink/constants/app.dart';

class PickImageView extends StatelessWidget {
  const PickImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = kImages;
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Padding(
            padding: EdgeInsets.all(30),
            child: AspectRatio(
              aspectRatio: 1,
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(item),
                  child: Image.asset(kImagePath + item)),
            ),
          );
        });
  }
}
