class Article {
  static final String titleField = 'title';
  static final String descriptionField = 'description';
  static final String priceField = 'price';
  static final String creationTimeField = 'creationTime';

  final String title;
  final String description;
  final int price;
  final DateTime creationTime;

  Article(this.title, this.description, this.price, this.creationTime);

  factory Article.fromEntity(Map<String, dynamic> data) {
    return Article(data[titleField], data[descriptionField], data[priceField],
        data[creationTimeField]);
  }
}
