// To parse this JSON data, do
//
//     final errorResponseModel = errorResponseModelFromJson(jsonString);
class ErrorResponseModel {
  final String? message;
  final bool? status;

  ErrorResponseModel({this.message, this.status});

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      ErrorResponseModel(message: json["message"], status: json["status"]);

  Map<String, dynamic> toJson() => {"message": message, "status": status};
}
