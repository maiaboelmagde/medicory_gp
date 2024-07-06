import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/models/patient_info_model.dart';

class PersonalInformations{
  Future<PatientInfoModel> getInfoService ({required String userCode}) async{
    Map<String, dynamic> data = await Api().getMap(url: 'http://192.168.1.12:8081/owners/${userCode}/personal-information');
    PatientInfoModel patientInfo = PatientInfoModel.fromjson(data,userCode: userCode);

    return patientInfo;
  }
}