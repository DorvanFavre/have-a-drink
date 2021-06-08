import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  final String title;
  final String description;
  final int price;
  final DateTime creationTime;
  final String image;
  final String docId;

  Article(this.title, this.description, this.price, this.creationTime,
      this.image, this.docId);
}
