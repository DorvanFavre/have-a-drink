import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/infrastructure/repository/fake_article_repository.dart';
import 'package:have_a_drink/infrastructure/repository/firebase_article_repository.dart';

abstract class ArticleRepository {
  factory ArticleRepository() {
    return FirebaseArticleRepository();
  }

  Future<List<Article>> getMore();

  Future<Result> add(Article article);

  Future<Result<Article>> getArticleFromId(String id);
}
