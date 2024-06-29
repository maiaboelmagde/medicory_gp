import 'package:medicory_gp/common/helpers/api.dart';

class LoginServices {
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    Map<String, dynamic> response = await Api().post(
        url: 'http://localhost:8081/auth/authenticate',
        body: {"email": email, "password": password});
    return response;
  }

  
}
