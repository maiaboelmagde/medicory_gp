import 'package:medicory_gp/common/models/login_info.dart';

class OwnerModel {
  final num id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String code;
  final LoginInfo loginInfo;

  const OwnerModel(
      {required this.id,
      required this.gender,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.code,
      required this.loginInfo
      });
  factory OwnerModel.fromjson(LoginInfo loginInfo,jsonData) {
    return OwnerModel(
      id: jsonData['id'],
      gender: jsonData['gender'],
      firstName: jsonData['firstName'],
      middleName: jsonData['middleName'],
      lastName: jsonData['lastName'],
      code: jsonData['user']['code'],
      loginInfo: loginInfo
    );
  }
}
