import 'dart:developer';

import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/doctor/models/disease_model.dart';

class ImmunizationsServices{
    Future<List<DiseaseModel>>getimmunizations({required String userCode})async{
    List<dynamic>data = await Api().getList(url: 'http://192.168.1.12:8081/doctors/patients/${userCode}/immunizations');
    List<DiseaseModel> immunizations= [];

    for(int i = 0; i<data.length;i++){
      immunizations.add(DiseaseModel.fromjson(data[i]));
    }
    return immunizations;
  }

  Future<DiseaseModel> getimmunizationById({required num id}) async{
    Map<String, dynamic> data = await Api().getMap(url: 'http://192.168.1.12:8081/doctors/patients/immunizations/${id}');
    DiseaseModel surgeryInfo = DiseaseModel.fromjson(data);

    return surgeryInfo;

  }


   Future<String>deleteimmunization({required num id})async{
    String data = await Api().deleteReturnString(url: 'http://192.168.1.12:8081/doctors/patients/immunizations/${id}');
    return data;
  }


   Future<String> AddNewimmunizations(
      {required String code,
      required String name,
      required String information}) async {
    String data = await Api().postReturnString(
        url: 'http://192.168.1.12:8081/doctors/patients/${code}/immunizations',
        body: {'name': name, 'information': information});
    return data;
  }


   Future<String> update(
      {required String userCode,
      required num id,
      required String name,
      required String information}) async {
        log(information);
    String data = await Api().putString(
        url:
            'http://192.168.1.12:8081/doctors/patients/${userCode}/immunizations/${id}',
        body: {"name": name, "information": information});
    return data;
  }
}