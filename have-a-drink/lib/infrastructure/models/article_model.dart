/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:have_a_drink/domain/entity/article.dart';

class ArticleModel extends Article {
  static final String titleField = 'title';
  static final String descriptionField = 'description';
  static final String priceField = 'price';
  static final String creationTimeField = 'creationTime';
  static final String imageField = 'image';

  ArticleModel(String title, String description, int price,
      DateTime creationTime, String image)
      : super(title, description, price, creationTime, image);

  factory ArticleModel.fromEntity(Map<String, dynamic> data) {
    return ArticleModel(
        data[titleField],
        data[descriptionField],
        data[priceField],
        (data[creationTimeField] as Timestamp).toDate(),
        data[imageField]);
  }

  Map<String, dynamic> toMap() {
    return {
      titleField: title,
      descriptionField: description,
      priceField: price,
      creationTimeField: creationTime,
      imageField: image
    };
  }
}



*/