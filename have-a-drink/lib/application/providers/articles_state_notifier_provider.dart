import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/notifiers/articles_state_notifier.dart';
import 'package:have_a_drink/application/providers/article_repository_provider.dart';
import 'package:have_a_drink/domain/entity/article.dart';

final articlesStateNotifierProvider =
    StateNotifierProvider<ArticlesStateNotifier, List<Article>>((ref) {
  final articleRepository = ref.watch(articleRepositoryProvider);
  return ArticlesStateNotifier(articleRepository);
});
