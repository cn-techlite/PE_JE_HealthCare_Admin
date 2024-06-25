import 'package:pe_je_healthcare_admin/core/components/helpers/firebase_constants.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';

class NotificationModel {
  final String? id;
  final String? userId;
  final String? title;
  final String? body;
  final String? deviceToken;
  final String? imageUrl;
  final String? notificationType;
  final Timestamp? updatedAt;
  final Timestamp? timestamp;
  NotificationModel({
    this.id,
    this.userId,
    this.title,
    this.body,
    this.deviceToken,
    this.imageUrl,
    this.notificationType,
    this.updatedAt,
    this.timestamp,
  });

  factory NotificationModel.fromDocument(DocumentSnapshot documentSnapshot) {
    String id = documentSnapshot[FirestoreConstants.id] ?? "";
    String userId = documentSnapshot[FirestoreConstants.userId] ?? "";
    String title = documentSnapshot[FirestoreConstants.title] ?? "";
    String body = documentSnapshot[FirestoreConstants.body] ?? "";
    String deviceToken = documentSnapshot[FirestoreConstants.deviceToken] ?? "";
    String imageUrl = documentSnapshot[FirestoreConstants.imageUrl] ?? "";
    String notificationType =
        documentSnapshot[FirestoreConstants.notificationType] ?? "";
    Timestamp updatedAt = documentSnapshot[FirestoreConstants.updatedAt] ?? 0.0;
    Timestamp timestamp = documentSnapshot[FirestoreConstants.timestamp];

    return NotificationModel(
      id: id,
      userId: userId,
      title: title,
      body: body,
      deviceToken: deviceToken,
      imageUrl: imageUrl,
      notificationType: notificationType,
      updatedAt: updatedAt,
      timestamp: timestamp,
    );
  }
}
