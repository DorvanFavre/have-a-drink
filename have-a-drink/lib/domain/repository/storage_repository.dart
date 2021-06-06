import 'package:have_a_drink/infrastructure/repository/firebase_storage_repository.dart';

abstract class StorageRepository {
  factory StorageRepository() {
    return FirebaseStorageRepository();
  }

  Future<String> getDownloadUrl(String path);
}
