import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:have_a_drink/domain/entity/result.dart';
import 'package:have_a_drink/domain/entity/article.dart';
import 'package:have_a_drink/domain/repository/article_repository.dart';
import 'package:have_a_drink/infrastructure/models/article_model.dart';

class FirebaseArticleRepository implements ArticleRepository {
  final kCollection = 'articles';

  @override
  Future<Result> add(Article article) {
    return FirebaseFirestore.instance
        .collection(kCollection)
        .add(article.toMap())
        .then((value) => Success() as Result)
        .catchError((e) => Failure(message: e.toString()));
  }

  DocumentSnapshot? lastDoc;

  @override
  Future<List<Article>> getMore() {
    final query = lastDoc == null
        ? FirebaseFirestore.instance
            .collection(kCollection)
            .orderBy(ArticleModel.creationTimeField, descending: true)
            .limit(5)
        : FirebaseFirestore.instance
            .collection(kCollection)
            .orderBy(ArticleModel.creationTimeField, descending: true)
            .startAfterDocument(lastDoc!)
            .limit(5);

    return query.get().then((snap) {
      if (snap.docs.length > 0) lastDoc = snap.docs.last;
      return snap.docs.map((doc) {
        return ArticleModel.fromFirestore(doc.id, doc.data());
      }).toList();
    }).catchError((e) {
      print(e);
      return [] as List<Article>;
    });
  }

  @override
  Future<Result<Article>> getArticleFromId(String id) {
    return FirebaseFirestore.instance
        .collection('articles')
        .doc(id)
        .get()
        .then((value) {
      if (!value.exists) return Failure<Article>();
      return Success(
              data: ArticleModel.fromFirestore(value.id, value.data() ?? {}))
          as Result<Article>;
    }).catchError((e) => Failure<Article>(message: e));
  }
}
