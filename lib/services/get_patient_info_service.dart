import 'package:medicory_gp/helpers/api.dart';
import 'package:medicory_gp/models/patient_info_model.dart';

class GetPatientInfoService{
  final String userCode;
  const GetPatientInfoService({required this.userCode});
  Future<List<PatientInfoModel>> patientInfo () async{
    List<dynamic> data = await Api().get(url: 'http://localhost:8081/doctors/patients/${userCode}/personal-information');
    List<PatientInfoModel> patientInfoList = [];

    for(int i= 0 ;i < data.length; i++){
      patientInfoList.add(PatientInfoModel.fromjson(data[i]));
    }

    return patientInfoList;
  }
}