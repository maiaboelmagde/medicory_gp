import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/models/surgery_model.dart';

class SurgeriesServices{
   Future<List<SurgeryModel>>getSurgicalHistory({required String userCode})async {
    List<dynamic> data = await Api().getList(url:  'http://192.168.1.12:8081/doctors/patients/${userCode}/surgeries' );

    List<SurgeryModel> surgeries = [];
    for(int i=0;i<data.length;i++){
      surgeries.add(SurgeryModel.fromjson(data[i]));
    }

    return surgeries;
  }

  Future<SurgeryModel> getSurgery({required num id}) async{
    Map<String, dynamic> data = await Api().getMap(url: 'http://192.168.1.12:8081/doctors/patients/surgeries/${id}');
    SurgeryModel surgeryInfo = SurgeryModel.fromjson(data);

    return surgeryInfo;

  }


   Future<String>deleteSurgery({required num id})async{
    try {
  String data = await Api().deleteReturnString(url: 'http://192.168.1.12:8081/doctors/patients/surgeries/${id}');
  return data;
} on Exception catch (e) {
  return 'This surgery already deleted';
}
  }


   Future<String> AddNewSurgery(
      {required String code,
      required String name,
      required String description}) async {
    String data = await Api().postReturnString(
        url: 'http://192.168.1.12:8081/doctors/patients/${code}/surgeries',
        body: {'name': name, 'description': description});
    return data;
  }

   Future<String> update(
      {required String userCode,
      required num id,
      required String name,
      required String description}) async {
    String data = await Api().putString(
        url:
            'http://192.168.1.12:8081/doctors/patients/${userCode}/surgeries/${id}',
        body: {"name": name, "description": description});
    return data;
  }
}