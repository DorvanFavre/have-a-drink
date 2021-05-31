/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:have_a_drink/domain/entity/article.dart';

extension Model on Article {
  static final String titleField = 'title';
  static final String descriptionField = 'description';
  static final String priceField = 'price';
  static final String creationTimeField = 'creationTime';
  static final String imageField = 'image';

  static Article fromEntity(Map<String, dynamic> data) {
    return Article(data[titleField], data[descriptionField], data[priceField],
        (data[creationTimeField] as Timestamp).toDate(), data[imageField]);
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