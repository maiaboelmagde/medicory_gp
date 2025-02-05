import 'dart:developer';

class LoginInfo {
  final num id;
  final String token;
  final String email;
  final String code;
  final String role;

  const LoginInfo(
      {required this.id,
      required this.token,
      required this.email,
      required this.code,
      required this.role});

  factory LoginInfo.fromjson(jsonData) {
    return LoginInfo(
        id: jsonData['id'],
        token: jsonData['token'],
        email: jsonData['email'],
        code: jsonData['code'],
        role: jsonData['role']);
  }
}

class DoctorInfo {
  final num doctorId;
  final String doctorName;
  final LoginInfo loginInfo;

  const DoctorInfo({required this.doctorId, required this.doctorName, required this.loginInfo});

  factory DoctorInfo.fromjson(LoginInfo logInInfo, jsonData) {
    return DoctorInfo(
      doctorId: jsonData['doctorId'],
      doctorName: jsonData['doctorName'],
      loginInfo: logInInfo
    );
  }
}
