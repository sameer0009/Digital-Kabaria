import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storageRepositoryProvider = Provider<StorageRepository>((ref) {
  return StorageRepository(FirebaseStorage.instance);
});

class StorageRepository {
  final FirebaseStorage _storage;

  StorageRepository(this._storage);

  Future<List<String>> uploadListingImages(String listingId, List<File> images) async {
    List<String> downloadUrls = [];
    
    for (int i = 0; i < images.length; i++) {
      final ref = _storage.ref().child('listings/$listingId/image_$i.jpg');
      final uploadTask = await ref.putFile(images[i]);
      final url = await uploadTask.ref.getDownloadURL();
      downloadUrls.add(url);
    }
    
    return downloadUrls;
  }
}
