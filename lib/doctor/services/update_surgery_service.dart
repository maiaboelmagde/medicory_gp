import 'package:medicory_gp/common/helpers/api.dart';

class UpdateSurgeryService {
  Future<String> update(
      {required String userCode,
      required num id,
      required String name,
      required String description}) async {
    String data = await Api().putString(
        url:
            'http://localhost:8081/doctors/patients/${userCode}/surgeries/${id}',
        body: {"name": name, "description": description});
    return data;
  }
}
