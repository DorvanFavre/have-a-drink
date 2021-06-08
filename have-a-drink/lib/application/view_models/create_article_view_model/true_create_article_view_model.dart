import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/entity/article.dart';

import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/domain/repository/article_repository.dart';

import 'create_article_view_model.dart';

class TrueCreateArticleViewModel implements CreateArticleViewModel {
  final ArticleRepository articleRepository;

  TrueCreateArticleViewModel(this.articleRepository);

  @override
  TextEditingController descriptionController = TextEditingController();

  @override
  TextEditingController priceController = TextEditingController();

  @override
  TextEditingController titleController = TextEditingController();

  @override
  Future<Result> add() {
    final creationTime = DateTime.now();
    final image = 'wine.jpg';
    final article = Article(titleController.text, descriptionController.text,
        int.parse(priceController.text), creationTime, image, 'no id yet');
    return articleRepository.add(article);
  }

  @override
  void clear() {
    titleController.clear();
    descriptionController.clear();
    priceController.clear();
  }
}
