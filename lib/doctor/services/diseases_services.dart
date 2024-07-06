import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/add_new_surgery.dart';
import 'package:medicory_gp/doctor/models/disease_model.dart';
import 'package:medicory_gp/common/models/surgery_model.dart';

class DiseasesServices{
  final String topic;
  DiseasesServices({required this.topic});
    Future<List<DiseaseModel>>getDiseases({required String userCode})async{
    List<dynamic>data = await Api().getList(url: 'http://192.168.1.12:8081/doctors/patients/${userCode}/${topic}');
    List<DiseaseModel> diseases= [];

    for(int i = 0; i<data.length;i++){
      diseases.add(DiseaseModel.fromjson(data[i]));
    }
    return diseases;
  }

  Future<DiseaseModel> getDiseaseById({required num id}) async{
    Map<String, dynamic> data = await Api().getMap(url: 'http://192.168.1.12:8081/doctors/patients/${topic}/${id}');
    DiseaseModel surgeryInfo = DiseaseModel.fromjson(data);

    return surgeryInfo;

  }


   Future<String>deleteDisease({required num id})async{
    try {
  String data = await Api().deleteReturnString(url: 'http://192.168.1.12:8081/doctors/patients/${topic}/${id}');
  return data;
} on Exception catch (e) {
  return 'This element already deleted ';
}
  }


   Future<String> AddNewDisease(
      {required String code,
      required String name,
      required String information}) async {
    String data = await Api().postReturnString(
        url: 'http://192.168.1.12:8081/doctors/patients/${code}/${topic}',
        body: {'name': name, 'information': information});
    return data;
  }


   Future<String> update(
      {required String userCode,
      required num id,
      required String name,
      required String information}) async {
    String data = await Api().putString(
        url:
            'http://192.168.1.12:8081/doctors/patients/${userCode}/${topic}/${id}',
        body: {"name": name, "information": information});
    return data;
  }
}