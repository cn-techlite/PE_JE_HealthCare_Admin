import 'package:pe_je_healthcare_admin/core/components/helpers/firebase_constants.dart';
import 'package:pe_je_healthcare_admin/core/components/helpers/globals.dart';
import 'package:pe_je_healthcare_admin/core/components/model/notification_model.dart';
import 'package:pe_je_healthcare_admin/core/components/utils/package_export.dart';

class GeneralServiceProvider {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Notification Stream
  late Stream<List<NotificationModel>> _streamNotification;
  Future<void> initNotification() async {
    final Query query = firebaseFirestore
        .collection(FirestoreConstants.notificationCollections)
        .where(FirestoreConstants.userId, isEqualTo: globals.userId);
    final Stream<QuerySnapshot> snapShots = query.snapshots();
    _streamNotification = snapShots.map((snapshot) {
      final List<DocumentSnapshot> documents = snapshot.docs;
      final result =
          documents.map((e) => NotificationModel.fromDocument(e)).toList();
      return result;
    });
  }

  Stream<List<NotificationModel>> get streamNotification {
    return _streamNotification;
  }
}

final streamRepo =
    Provider<GeneralServiceProvider>((ref) => GeneralServiceProvider());

final getListNotification =
    StreamProvider.autoDispose<List<NotificationModel>>((ref) {
  final streamServices = ref.watch(streamRepo);
  streamServices.initNotification();
  return streamServices.streamNotification;
});
