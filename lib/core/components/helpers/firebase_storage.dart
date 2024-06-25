import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

import '../utils/package_export.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadProfileToStorage(
      String childName, File file, bool isPost) async {
    String id = const Uuid().v1();
    Reference ref = _storage.ref().child(childName).child(id);
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> uploadFileStorage(
      String childName, File file, bool isPost) async {
    String id = const Uuid().v1();
    Reference ref = _storage.ref().child(childName).child(id);
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<List<String>> uploadCatalogPics(
      String childName, List<File> file, bool isPost) async {
    // creating location to our firebase storage
    var imageUrls = await Future.wait(
        file.map((file) => _uploadFiles(childName, file, isPost)));
    return imageUrls;
  }

  Future<String> _uploadFiles(childName, File file, bool isPost) async {
    String id = const Uuid().v1();
    Reference ref = _storage.ref().child(childName).child(id);
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
