import 'package:have_a_drink/domain/entity/article.dart';

abstract class ArticleRepository {
  factory ArticleRepository() {
    throw UnimplementedError();
  }

  List<Article> getMore();
}
