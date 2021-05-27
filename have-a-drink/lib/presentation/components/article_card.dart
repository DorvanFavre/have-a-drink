import 'package:flutter/material.dart';
import 'package:have_a_drink/domain/entity/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Theme.of(context).cardColor),
    );
  }
}
