import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/application/providers/article_repository_provider.dart';
import 'package:have_a_drink/application/view_models/create_article_view_model/create_article_view_model.dart';

final createArticleViewModelProvider = Provider<CreateArticleViewModel>((ref) {
  final articleRepository = ref.watch(articleRepositoryProvider);
  return CreateArticleViewModel(articleRepository);
});
