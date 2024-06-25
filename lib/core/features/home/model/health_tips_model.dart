// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../components/helpers/firebase_constants.dart';

class HealthTipStudioModel {
  final String? id;
  final String? content;
  final String? title;
  final String? imagePath;
  final Timestamp? timestamp;
  final String? datePublished;

  HealthTipStudioModel({
    this.id,
    this.content,
    this.title,
    this.imagePath,
    this.timestamp,
    this.datePublished,
  });

  factory HealthTipStudioModel.fromDocument(DocumentSnapshot documentSnapshot) {
    String id = documentSnapshot[FirestoreConstants.id] ?? "";
    String content = documentSnapshot[FirestoreConstants.content] ?? "";
    String title = documentSnapshot[FirestoreConstants.title] ?? "";
    String imagePath = documentSnapshot[FirestoreConstants.imagePath] ?? "";
    Timestamp timestamp =
        documentSnapshot[FirestoreConstants.timestamp] ?? Timestamp.now();
    String datePublished =
        documentSnapshot[FirestoreConstants.datePublished] ?? "";

    return HealthTipStudioModel(
      id: id,
      content: content,
      title: title,
      imagePath: imagePath,
      timestamp: timestamp,
      datePublished: datePublished,
    );
  }

  Map<String, dynamic> toJson() => {
        FirestoreConstants.id: id,
        FirestoreConstants.content: content,
        FirestoreConstants.title: title,
        FirestoreConstants.imagePath: imagePath,
        FirestoreConstants.timestamp: timestamp,
        FirestoreConstants.datePublished: datePublished,
      };
}
