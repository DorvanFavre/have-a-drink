import 'package:flutter/material.dart';
import 'package:have_a_drink/application/providers/article_repository_provider.dart';
import 'package:have_a_drink/constants/app.dart';
import 'package:have_a_drink/constants/view.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/presentation/components/button_admin.dart';
import 'package:have_a_drink/presentation/components/button_text.dart';
import 'package:have_a_drink/presentation/wrappers/admin_wrapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailView extends StatelessWidget {
  final Article article;

  DetailView(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scroll view
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(kImagePath + this.article.image),
                  ),

                  //Title
                  Text(
                    article.title,
                    style: TextStyle(fontSize: 30, color: Colors.black87),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    article.description,
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Admin
                  AdminWrapper(
                    child: Center(
                      child: ButtonAdmin(
                        text: 'delete',
                        onTap: () {
                          context
                              .read(articleRepositoryProvider)
                              .remove(article)
                              .then((result) {
                            if (result is Success) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Article deleted'),
                              ));

                              Navigator.of(context).pop();
                            } else if (result is Failure) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(result.message),
                              ));
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),

          // back arrow
          Padding(
            padding: const EdgeInsets.all(20),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded)),
          ),

          // add to basket button

          Padding(
            padding: const EdgeInsets.all(40),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonText(onTap: () {}, text: 'ADD')),
          )
        ],
      ),
    );
  }
}
