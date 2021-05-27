import 'package:flutter/material.dart';
import 'package:have_a_drink/domain/entity/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Theme.of(context).cardColor),
      child: Row(
        children: [
          // Image
          Container(
            color: Colors.red,
            width: 100,
          ),
          Column(
            children: [
              Text(article.title),
              Text(article.description),
              Text(article.price.toString())
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          )
        ],
      ),
    );
  }
}
