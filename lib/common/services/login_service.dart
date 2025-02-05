import 'dart:developer';

import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/models/login_info.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';

class LoginServices {
  Future<LoginInfo?> login(
      {required String email, required String password}) async {
    Map<String, dynamic>? response;
    LoginInfo loginInfo;

    try {
      log(email);
      log(password);
      response = await Api().post(
          url: 'http://192.168.1.12:8081/auth/authenticate',
          body: {"email": email, "password": password});
         
          loginInfo = LoginInfo.fromjson(response);
          
          return loginInfo;
          
    } on Exception catch (e) {
      
      return null;
    }
    
    
  }
  Future<DoctorInfo?> getDoctorInfo({required LoginInfo loginInfo,required String doctorCode}) async {
    DoctorInfo? curUser;
    try {
      Map<String, dynamic> response = await Api()
          .getMap(url: 'http://192.168.1.12:8081/admin/doctors/code/${doctorCode}');
      curUser = DoctorInfo.fromjson(loginInfo, response);
    } on Exception catch (e) {
      print(e);
    }
    return curUser;
  }

  Future<OwnerModel?> getOwnerCode({required LoginInfo loginInfo,required num ownerId}) async {
    OwnerModel? curOwner;
    try {
      Map<String, dynamic> response = await Api()
          .getMap(url: 'http://192.168.1.12:8081/admin/owners/id/${ownerId}');
      curOwner = OwnerModel.fromjson(loginInfo, response);
    } on Exception catch (e) {
      print(e);
    }
    return curOwner;
  }

  Future<String?> forgotPassword({required String email}) async {
    String? response;
    try {
       response = await Api().postReturnString200(url: 'http://192.168.1.12:8081/auth/forgot-password?email=${email}', body: {});
      
    } on Exception catch (e) {
      print(e.toString());
    }
    return response;
  }

  Future<String?> verifingCode({required String email, required String verifyCode}) async {
    String? response;
    try {
       response = await Api().postReturnString200(url: 'http://192.168.1.12:8081/auth/verify-password-reset-code?email=${email}&code=${verifyCode}', body: {});
      
    } on Exception catch (e) {
      print(e.toString());
    }
    return response;
  }

  Future<String?> ResetPassword({required String email, required String passWord}) async {
    String? response;
    try {
       response = await Api().postReturnString200(url: 'http://192.168.1.12:8081/auth/reset-password?email=${email}&newPassword=${passWord}', body: {});
      
    } on Exception catch (e) {
      print(e.toString());
    }
    return response;
  }


}
