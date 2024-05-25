import 'package:medicory_gp/common/helpers/api.dart';

class AddNewSurgeryService {
  Future<String> add(
      {required String code,
      required String name,
      required String description}) async {
    String data = await Api().postReturnString(
        url: 'http://localhost:8081/doctors/patients/${code}/surgeries',
        body: {'name': name, 'description': description});
    return data;
  }
}
