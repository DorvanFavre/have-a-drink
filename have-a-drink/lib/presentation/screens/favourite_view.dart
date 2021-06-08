import 'package:flutter/material.dart';
import 'package:have_a_drink/application/providers/article_repository_provider.dart';
import 'package:have_a_drink/application/providers/identity_state_notifier_provider.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/entity/identity.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/presentation/components/article_card.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  _FavouriteViewState createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  //ValueNotifier<List<Article>> articlesNotifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final identityState = watch(identityStateNotifierProvider);

      if (identityState is Identity) {
        // get articles ids
        final articlesIds = identityState.favouritesArticles;
        return ListView.builder(
            itemCount: articlesIds.length,
            itemBuilder: (context, index) {
              final articleId = articlesIds[index];

              // get Article
              return FutureBuilder<Result<Article>>(
                  future: context
                      .read(articleRepositoryProvider)
                      .getArticleFromId(articleId),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.done) {
                      final result = snap.data;

                      if (result is Success<Article>) {
                        return ArticleCard(result.data!);
                      } else
                        return SizedBox.shrink();
                    } else
                      return SizedBox.shrink();
                  });
            });
      } else
        return Center(
          child: Text('No identity'),
        );
    });
  }
}
