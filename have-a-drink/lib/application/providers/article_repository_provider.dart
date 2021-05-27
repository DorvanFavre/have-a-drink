import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/repository/article_repository.dart';

final articleRepositoryProvider = Provider<ArticleRepository>((ref) {
  return ArticleRepository();
});
