import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/repository/article_repository.dart';

class ArticlesStateNotifier extends StateNotifier<List<Article>> {
  final ArticleRepository articleRepository;

  ArticlesStateNotifier(this.articleRepository) : super([]) {
    getMore();
  }

  bool fetchingData = false;
  void getMore() {
    if (!fetchingData) {
      fetchingData = true;
      articleRepository.getMore().then((articles) {
        fetchingData = false;

        state.addAll(articles);
        state = state;
      });
    }
  }
}
