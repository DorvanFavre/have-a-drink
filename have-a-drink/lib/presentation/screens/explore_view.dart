import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/articles_state_notifier_provider.dart';
import 'package:have_a_drink/application/providers/auth_state_notifier_provider.dart';
import 'package:have_a_drink/constants/view.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/presentation/components/article_card.dart';
import 'package:have_a_drink/presentation/screens/create_article_view.dart';
import 'package:have_a_drink/presentation/wrappers/admin_wrapper.dart';

class ExploreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: kGeneralPadding),
        child: Consumer(builder: (context, watch, child) {
          final articles = watch(articlesStateNotifierProvider);

          return NotificationListener(
            onNotification: (ScrollNotification scrollNotification) {
              if (scrollNotification is ScrollEndNotification &&
                  scrollNotification.metrics.extentAfter == 0) {
                context.read(articlesStateNotifierProvider.notifier).getMore();
                return true;
              } else
                return false;
            },
            child: Column(
              children: [
                AdminWrapper(
                    child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateArticleView()));
                      },
                      icon: Icon(Icons.add)),
                )),
                Expanded(
                  child: ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            myTitle(context, index),
                            ArticleCard(article),
                          ],
                        );
                      }),
                ),
              ],
            ),
          );
        }));
  }
}

Widget myTitle(BuildContext context, int index) {
  return index == 0
      ? Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: RichText(
            text: TextSpan(
                text: 'Discover our\n',
                style: Theme.of(context).textTheme.headline4,
                children: [
                  TextSpan(
                      text: 'best ',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Theme.of(context).colorScheme.primary)),
                  TextSpan(
                      text: 'products',
                      style: Theme.of(context).textTheme.headline4)
                ]),
          ),
        )
      : SizedBox.shrink();
}
