import 'package:firebase_storage/firebase_storage.dart';
import 'package:have_a_drink/domain/repository/storage_repository.dart';

class FirebaseStorageRepository implements StorageRepository {
  @override
  Future<String> getDownloadUrl(String path) {
    /*final ref = FirebaseStorage.instance.ref('/' + path);
    print('firebase storage repository : ref : ' + ref.toString());
    final url = ref.getDownloadURL()
      ..then((value) =>
          print('firebase storage repository : url : ' + value.toString()))
      ..catchError((e) {
        print('firebase storage repository : error : ' + e.toString());
      });*/

    return FirebaseStorage.instance.ref('/' + path).getDownloadURL();
  }
}
