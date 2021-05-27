import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/articles_state_notifier_provider.dart';
import 'package:have_a_drink/constants/view.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/presentation/components/article_card.dart';

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
            child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ArticleCard(article);
                }),
          );
        }));
  }
}
