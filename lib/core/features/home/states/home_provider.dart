// ignore_for_file: use_build_context_synchronously

import 'package:pe_je_healthcare_admin/core/features/home/model/notification_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/service_user_response_model.dart';
import 'package:pe_je_healthcare_admin/core/features/home/model/users_response_model.dart';

// ignore: unused_import
import '../../../components/helpers/firebase_constants.dart';
import '../../../components/utils/package_export.dart';

import '../services/home_service.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final String message;
  HomeSuccess({required this.message});
}

class HomeUpdate extends HomeState {
  final String message;
  HomeUpdate({required this.message});
}

class HomeFailure extends HomeState {
  final String error;
  HomeFailure({required this.error});
}

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeServices home;
  List<ServiceUserResponseModel> allServiceUsers = [];
  List<UserResponseModel> allUserData = [];
  ServiceUserResponseModel serviceUserModel = ServiceUserResponseModel();
  // Notifications
  List<NotificationResponseModel> notifications = [];
  NotificationResponseModel notificationModel = NotificationResponseModel();

  HomeNotifier({required this.home}) : super(HomeInitial());

// Service Users
  getAllServiceUserData() async {
    try {
      if (!mounted) {
        state = HomeLoading();
        return;
      }
      List<ServiceUserResponseModel> response2 =
          await home.getAllServiceUserData();
      allServiceUsers = response2;
      state = HomeSuccess(message: "All Homes Loaded");
    } on Exception catch (e) {
      state = HomeFailure(error: e.toString());
    }
  }

  ServiceUserResponseModel? fetchServiceUserById(String stationId) {
    ServiceUserResponseModel? serviceUser = ServiceUserResponseModel();
    for (var serviceUser2 in allServiceUsers) {
      if (serviceUser2.id == stationId) {
        serviceUser = serviceUser2;
      }
    }
    return serviceUser;
  }

  addServiceUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String address,
      required String dateOfBirth,
      required String imageProfile,
      required String communication,
      required String mobilization,
      required String washingAndDressing,
      required String medication,
      required String eyesight,
      required String socialActivities,
      required String fallRisk,
      required String foodAndFluid,
      required BuildContext context}) async {
    try {
      if (!mounted) {
        state = HomeLoading();
        return;
      }
      var response = await home.addServiceUser(
          firstName: firstName,
          lastName: lastName,
          email: email,
          address: address,
          dateOfBirth: dateOfBirth,
          imageProfile: imageProfile,
          communication: communication,
          mobilization: mobilization,
          washingAndDressing: washingAndDressing,
          medication: medication,
          eyesight: eyesight,
          socialActivities: socialActivities,
          fallRisk: fallRisk,
          foodAndFluid: foodAndFluid);
      if (response) {
        if (!mounted) return;
        state = HomeSuccess(message: "");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User Updated Successfully")));
      } else {
        state = HomeFailure(error: "User Not Found");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User Not Found")));
      }
    } on Exception catch (e) {
      state = HomeFailure(error: e.toString());
    }
  }

  updateServiceUser(
      {required String serviceUserId,
      String? firstName,
      String? lastName,
      String? email,
      String? address,
      String? dateOfBirth,
      String? imageProfile,
      String? communication,
      String? mobilization,
      String? washingAndDressing,
      String? medication,
      String? eyesight,
      String? socialActivities,
      String? fallRisk,
      String? foodAndFluid,
      String? dayString,
      String? morningUserId,
      String? morningUserName,
      String? nightUserId,
      String? nightUserName,
      required BuildContext context}) async {
    try {
      if (!mounted) {
        state = HomeLoading();
        return;
      }
      var response = await home.updateServiceUser(
          serviceUserId: serviceUserId,
          firstName: firstName,
          lastName: lastName,
          email: email,
          address: address,
          dateOfBirth: dateOfBirth,
          imageProfile: imageProfile,
          communication: communication,
          mobilization: mobilization,
          washingAndDressing: washingAndDressing,
          medication: medication,
          eyesight: eyesight,
          socialActivities: socialActivities,
          fallRisk: fallRisk,
          foodAndFluid: foodAndFluid,
          dayString: dayString,
          morningUserId: morningUserId,
          morningUserName: morningUserName,
          nightUserId: nightUserId,
          nightUserName: nightUserName);
      if (response) {
        if (!mounted) return;
        state = HomeSuccess(message: "");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User Updated Successfully")));
      } else {
        state = HomeFailure(error: "User Not Found");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User Not Found")));
      }
    } on Exception catch (e) {
      state = HomeFailure(error: e.toString());
    }
  }

  deleteServiceUser(
      {required String serviceUserId, required BuildContext context}) async {
    try {
      if (!mounted) {
        state = HomeLoading();
        return;
      }
      var response = await home.deleteServiceUser(id: serviceUserId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!mounted) return;
        state = HomeSuccess(message: "");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User Deleted Successfully")));
      } else {
        state = HomeFailure(error: "User Not Found");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User Not Found")));
      }
    } on Exception catch (e) {
      state = HomeFailure(error: e.toString());
    }
  }

// Users

  getAllUsersData() async {
    try {
      if (!mounted) {
        state = HomeLoading();
        return;
      }
      List<UserResponseModel> response2 = await home.getAllUserData();
      allUserData = response2;
      state = HomeSuccess(message: "All Notifications Loaded");
    } on Exception catch (e) {
      state = HomeFailure(error: e.toString());
    }
  }

  deleteUser({required String userId, required BuildContext context}) async {
    try {
      if (!mounted) {
        state = HomeLoading();
        return;
      }
      var response = await home.deleteUser(id: userId);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!mounted) return;
        state = HomeSuccess(message: "");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User Deleted Successfully")));
      } else {
        state = HomeFailure(error: "User Not Found");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("User Not Found")));
      }
    } on Exception catch (e) {
      state = HomeFailure(error: e.toString());
    }
  }

// Notifications
  getNotificationData({required String id}) async {
    try {
      if (!mounted) {
        state = HomeLoading();
        return;
      }
      NotificationResponseModel response2 =
          await home.getNotificationData(id: id);
      notificationModel = response2;
      state = HomeSuccess(message: "${response2.id} Notification Loaded");
    } on Exception catch (e) {
      state = HomeFailure(error: e.toString());
    }
  }

  getAllNotificationData() async {
    try {
      if (!mounted) {
        state = HomeLoading();
        return;
      }
      List<NotificationResponseModel> response2 =
          await home.getAllNotificationData();
      notifications = response2;
      state = HomeSuccess(message: "All Notifications Loaded");
    } on Exception catch (e) {
      state = HomeFailure(error: e.toString());
    }
  }
}

final streamRepositoryProvider =
    Provider<HomeServices>((ref) => HomeServices());
final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final HomeServices home = HomeServices();
  return HomeNotifier(home: home);
});

// New One Stream
class NewHomeStateService {
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

final streamRepo =
    Provider<NewHomeStateService>((ref) => NewHomeStateService());

final getListServiceUser =
    StreamProvider.autoDispose<List<ServiceUserResponseModel>>((ref) {
  final streamServices = ref.watch(streamRepo);
  streamServices.initServiceUser();
  return streamServices.streamServiceUser;
});

// User List
final getListUsers = StreamProvider.autoDispose<List<UserResponseModel>>((ref) {
  final streamServices = ref.watch(streamRepo);
  streamServices.init();
  return streamServices.stream;
});
