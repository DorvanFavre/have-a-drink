import 'package:flutter/material.dart';
import 'package:have_a_drink/constants/app.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/presentation/screens/detail_view.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  ArticleCard(this.article);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            opaque: false, pageBuilder: (context, _, __) => DetailView()));

        //showDialog(context: context, builder: (context) => SimpleDialog());
      },
      child: Container(
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
              width: 100,
              color: Colors.red,
              /*child: Image(
                  image: NetworkImage(kImagePath + article.image),
                )
                */
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 3,
                ),
                Text(
                  article.title,
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                Text(
                  article.description,
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                Spacer(flex: 1),
                Text(
                  article.price.toString() + ' CHF',
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                ),
                Spacer(flex: 1),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            )
          ],
        ),
      ),
    );
  }
}
