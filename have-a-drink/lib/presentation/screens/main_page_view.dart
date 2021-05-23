import 'package:flutter/material.dart';
import 'package:have_a_drink/constants/view.dart';

class MainPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Top bar
      Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kGeneralPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_bag_rounded)),
            ],
          ),
        ),
      ),
      // PageView
      //PageView(),
      Expanded(child: SizedBox.shrink()),
      Container(
        height: 50,
        decoration:
            BoxDecoration(color: Theme.of(context).backgroundColor, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(0, -5),
              blurRadius: 10,
              spreadRadius: 3)
        ]),
      )
    ]);
  }
}
