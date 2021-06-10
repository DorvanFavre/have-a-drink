import 'package:flutter/cupertino.dart';
import 'package:have_a_drink/application/view_models/create_article_view_model/true_create_article_view_model.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/domain/repository/article_repository.dart';

abstract class CreateArticleViewModel {
  factory CreateArticleViewModel(ArticleRepository articleRepository) {
    return TrueCreateArticleViewModel(articleRepository);
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  ValueNotifier<String?> imageNotifier = ValueNotifier(null);

  Future<Result> add();

  void clear();
}
