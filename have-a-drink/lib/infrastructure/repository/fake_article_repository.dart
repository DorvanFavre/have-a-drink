import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/repository/article_repository.dart';

class FakeArticleRepository implements ArticleRepository {
  List<Article> articles = [];

  @override
  List<Article> getMore() {
    return articles
      ..addAll(List.generate(
          5,
          (index) =>
              Article('title $index', 'description', 5, DateTime.now())));
  }
}
