import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/models/patient_info_model.dart';

class GetPatientInfoService{
  final String userCode;
  const GetPatientInfoService({required this.userCode});
  Future<PatientInfoModel> patientInfo () async{
    Map<String, dynamic> data = await Api().getMap(url: 'http://192.168.1.12:8081/doctors/patients/${userCode}/personal-information');
    PatientInfoModel patientInfo = PatientInfoModel.fromjson(data,userCode: userCode);

    return patientInfo;
  }
}