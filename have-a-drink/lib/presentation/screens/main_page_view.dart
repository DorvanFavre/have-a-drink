import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/admin_state_provider.dart';
import 'package:have_a_drink/constants/view.dart';
import 'package:have_a_drink/presentation/screens/explore_view.dart';
import 'package:have_a_drink/presentation/screens/profile_view.dart';
import 'package:have_a_drink/presentation/wrappers/admin_wrapper.dart';
import 'package:have_a_drink/presentation/wrappers/auth_wrapper.dart';

import 'auth_view.dart';

class MainPageView extends StatelessWidget {
  final ValueNotifier<int> indexNotifier = ValueNotifier(2);

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
              // Profile
              IconButton(
                  onPressed: () {
                    AuthWrapper(context, () {
                      indexNotifier.value = 0;
                    });
                  },
                  icon: Icon(Icons.person)),

              AdminWrapper(
                  child: Icon(
                Icons.vpn_key,
                color: Colors.red,
              )),
              // Basket
              IconButton(
                  onPressed: () {
                    indexNotifier.value = 1;
                  },
                  icon: Icon(Icons.shopping_bag_rounded)),
            ],
          ),
        ),
      ),
      // PageView
      Expanded(
        child: ValueListenableBuilder<int>(
            valueListenable: indexNotifier,
            builder: (context, value, child) => IndexedStack(
                  index: value,
                  children: [
                    ProfileView(),
                    Container(
                      color: Colors.blue,
                    ),
                    ExploreView(),
                  ],
                )),
      ),

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  indexNotifier.value = 2;
                },
                icon: Icon(Icons.explore)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          ],
        ),
      )
    ]);
  }
}
