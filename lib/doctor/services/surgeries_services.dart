import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/add_new_surgery.dart';
import 'package:medicory_gp/doctor/models/surgery_model.dart';

class SurgeriesServices{
   Future<List<SurgeryModel>>getSurgicalHistory({required String userCode})async {
    List<dynamic> data = await Api().getList(url:  'http://localhost:8081/doctors/patients/${userCode}/surgeries' );

    List<SurgeryModel> surgeries = [];
    for(int i=0;i<data.length;i++){
      surgeries.add(SurgeryModel.fromjson(data[i]));
    }

    return surgeries;
  }

  Future<SurgeryModel> getSurgery({required num id}) async{
    Map<String, dynamic> data = await Api().getMap(url: 'http://localhost:8081/doctors/patients/surgeries/${id}');
    SurgeryModel surgeryInfo = SurgeryModel.fromjson(data);

    return surgeryInfo;

  }


   Future<String>deleteSurgery({required num id})async{
    String data = await Api().deleteReturnString(url: 'http://localhost:8081/doctors/patients/surgeries/${id}');
    return data;
  }


   Future<String> AddNewSurgery(
      {required String code,
      required String name,
      required String description}) async {
    String data = await Api().postReturnString(
        url: 'http://localhost:8081/doctors/patients/${code}/surgeries',
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
            'http://localhost:8081/doctors/patients/${userCode}/surgeries/${id}',
        body: {"name": name, "description": description});
    return data;
  }
}