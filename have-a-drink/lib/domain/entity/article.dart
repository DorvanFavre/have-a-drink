import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  static final String titleField = 'title';
  static final String descriptionField = 'description';
  static final String priceField = 'price';
  static final String creationTimeField = 'creationTime';
  static final String imageField = 'image';

  final String title;
  final String description;
  final int price;
  final DateTime creationTime;
  final String image;

  Article(
      this.title, this.description, this.price, this.creationTime, this.image);

  factory Article.fromEntity(Map<String, dynamic> data) {
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
