import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/infrastructure/repository/fake_article_repository.dart';

abstract class ArticleRepository {
  factory ArticleRepository() {
    return FakeArticleRepository();
  }

  List<Article> getMore();
}
