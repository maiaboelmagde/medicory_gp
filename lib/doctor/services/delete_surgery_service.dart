import 'package:medicory_gp/common/helpers/api.dart';

class DeleteSurgeryService{
  Future<String>deleteSurgery({required num id})async{
    String data = await Api().deleteReturnString(url: 'http://localhost:8081/doctors/patients/surgeries/${id}');
    return data;
  }
}