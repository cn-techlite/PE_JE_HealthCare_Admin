class AddAdminModel {
  final String? adminType;
  final String? firstName;
  final String? surName;
  final String? email;
  final String? password;
  final String? sex;
  final String? staffCode;
  final String? phoneNo;
  final String? state;
  final String? locality;
  final String? address;
  final String? branch;

  AddAdminModel({
    this.adminType,
    this.firstName,
    this.surName,
    this.email,
    this.password,
    this.sex,
    this.staffCode,
    this.phoneNo,
    this.state,
    this.locality,
    this.address,
    this.branch,
  });

  factory AddAdminModel.fromJson(Map<String, dynamic> json) => AddAdminModel(
        adminType: json["adminType"],
        firstName: json["firstName"],
        surName: json["surName"],
        email: json["email"],
        password: json["password"],
        sex: json["sex"],
        staffCode: json["staffCode"],
        phoneNo: json["phoneNo"],
        state: json["state"],
        locality: json["locality"],
        address: json["address"],
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "adminType": adminType,
        "firstName": firstName,
        "surName": surName,
        "email": email,
        "password": password,
        "sex": sex,
        "staffCode": staffCode,
        "phoneNo": phoneNo,
        "state": state,
        "locality": locality,
        "address": address,
        "branch": branch,
      };
}
