import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/repository/article_repository.dart';

class ArticlesStateNotifier extends StateNotifier<List<Article>> {
  final ArticleRepository articleRepository;

  ArticlesStateNotifier(this.articleRepository) : super([]);

  void getMore() {
    state = articleRepository.getMore();
  }
}
