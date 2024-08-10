import 'package:pe_je_healthcare_admin/core/features/home/model/service_user_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/users_response_model.dart';

// ignore: unused_import
import '../../../components/helpers/firebase_constants.dart';
import '../../../components/utils/package_export.dart';

import '../services/home_service.dart';

class HomeProvider with ChangeNotifier {
  final HomeServices _services = HomeServices();

// Get All Users
  List<UserResponseModel> allUserData = [];
  bool haveData = false;
  getAllUsersData(context) async {
    haveData = true;
    // notifyListeners();
    allUserData = await _services.getAllUserData();
    haveData = false;
    notifyListeners();
  }

  void deleteUser({
    required context,
    required String userId,
  }) async {
    // notifyListeners();
    final response = await _services.deleteUser(
      id: userId,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User Deleted Successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User Not Deleted'),
          duration: Duration(seconds: 2),
        ),
      );
    }
    notifyListeners();
  }

// Get All Service User
  List<ServiceUserResponseModel> allServiceUserData = [];
  bool haveServiceUserData = false;
  getAllServiceUserData(context) async {
    haveServiceUserData = true;
    // notifyListeners();
    allServiceUserData = await _services.getAllServiceUserData();
    haveServiceUserData = false;
    notifyListeners();
  }

  void addTaskUser({
    required context,
    required String serviceUserId,
    required String userVisitId,
    required String userVisitName,
    required String endpoint,
  }) async {
    // notifyListeners();
    await _services.addTaskUser(
      serviceUserId: serviceUserId,
      userVisitId: userVisitId,
      userVisitName: userVisitName,
      endpoint: endpoint,
    );
    notifyListeners();
  }

  void deleteServiceUser({
    required context,
    required String serviceUserId,
  }) async {
    // notifyListeners();
    await _services.deleteServiceUser(
      id: serviceUserId,
    );
    notifyListeners();
  }
}

// New One Stream
class NewUserStateService {
  late Stream<List<UserResponseModel>> _stream;
  init() async {
    var homeService = HomeServices();
    _stream = homeService.getAllStreamUserData();
    final result = _stream;
    return result;
  }

  Stream<List<UserResponseModel>> get stream {
    return _stream;
  }

  // List of Service User
  late Stream<List<ServiceUserResponseModel>> _streamServiceUser;
  initServiceUser() async {
    var homeService = HomeServices();
    _streamServiceUser = homeService.getAllStreamServiceUserData();
    final result = _streamServiceUser;
    return result;
  }

  Stream<List<ServiceUserResponseModel>> get streamServiceUser {
    return _streamServiceUser;
  }
}

final homeProvider = ChangeNotifierProvider<HomeProvider>(
  (ref) => HomeProvider(),
);
//final streamRepo = Provider<HomeServices>((ref) => HomeServices());
final userRepo = Provider<NewUserStateService>((ref) => NewUserStateService());

final getListServiceUser =
    StreamProvider.autoDispose<List<ServiceUserResponseModel>>((ref) {
  final streamServices = ref.watch(userRepo);
  streamServices.initServiceUser();
  return streamServices.streamServiceUser;
});

// User List
// final getListUsers = StreamProvider.autoDispose<List<UserModel>>((ref) {
//   final streamServices = ref.watch(streamRepo);
//   streamServices.initListOfAllUser();
//   return streamServices.streamListOfAllUser;
// });

// User List
final getListUsers = StreamProvider.autoDispose<List<UserResponseModel>>((ref) {
  final streamServices = ref.watch(userRepo);
  streamServices.init();
  return streamServices.stream;
});
