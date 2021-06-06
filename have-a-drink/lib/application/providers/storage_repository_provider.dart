import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:have_a_drink/domain/repository/storage_repository.dart';

final storageRepositoryProvider = Provider<StorageRepository>((ref) {
  return StorageRepository();
});
