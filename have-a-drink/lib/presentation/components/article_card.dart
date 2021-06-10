import 'package:flutter/material.dart';
import 'package:have_a_drink/application/providers/identity_state_notifier_provider.dart';
import 'package:have_a_drink/constants/app.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/entity/identity.dart';
import 'package:have_a_drink/presentation/components/my_image.dart';
import 'package:have_a_drink/presentation/screens/auth_view.dart';
import 'package:have_a_drink/presentation/screens/detail_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard(this.article);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailView(article)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        height: 120,
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Theme.of(context).cardColor),
        child: Stack(
          children: [
            Row(
              children: [
                // Image
                AspectRatio(
                  aspectRatio: 1,
                  child: MyImage(path: article.image),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      article.title,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                    Text(
                      article.description,
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Spacer(flex: 1),
                    Text(
                      article.price.toString() + ' CHF',
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
                Spacer(),

                // Favourite
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Consumer(builder: (context, watch, child) {
                final identity = watch(identityStateNotifierProvider);

                if (identity is Identity) {
                  bool favourited =
                      identity.favouritesArticles.contains(article.docId);

                  return IconButton(
                    onPressed: () {
                      context
                          .read(identityStateNotifierProvider.notifier)
                          .toggleFavorite(article);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: favourited
                          ? Colors.red
                          : Theme.of(context).iconTheme.color,
                    ),
                  );
                }
                return IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AuthView()));
                  },
                  icon: Icon(
                    Icons.favorite,
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
