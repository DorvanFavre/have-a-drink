import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/domain/repository/article_repository.dart';

class FakeArticleRepository implements ArticleRepository {
  List<Article> articles = [];

  @override
  Future<List<Article>> getMore() {
    return Future.value(articles
      ..addAll(List.generate(
          5,
          (index) => Article(
              'title $index', 'description', 5, DateTime.now(), 'wine.png'))));
  }

  @override
  Future<Result> add(Article article) {
    return Future.value(Success());
  }
}
