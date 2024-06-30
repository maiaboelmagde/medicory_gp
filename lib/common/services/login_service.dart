import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';

class LoginServices {
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    Map<String, dynamic> response = await Api().post(
        url: 'http://localhost:8081/auth/authenticate',
        body: {"email": email, "password": password});
    return response;
  }

  Future<OwnerModel> getOwnerCode({required num ownerId})async{
    Map<String, dynamic> response = await Api().getMap(url: 'http://localhost:8081/admin/owners/id/${ownerId}');
    return OwnerModel.fromjson(response);
  }

  
}
