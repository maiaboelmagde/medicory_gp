import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/models/surgery_model.dart';
import 'package:medicory_gp/doctor/models/disease_model.dart';

class MedicalHistoryServices{
  Future<List<SurgeryModel>> getAllSurgries({required String UserCode})async{
   List<dynamic> response = await Api().getList(url: 'http://192.168.1.12:8081/owners/${UserCode}/medical-history/surgeries');
   List<SurgeryModel> surgeries= [];
    for(int i=0;i<response.length;i++){
      surgeries.add(SurgeryModel.fromjson(response[i]));
    }
    
    return surgeries;
  }

  Future<List<DiseaseModel>>getDiseases({required String userCode})async{
    List<dynamic>data = await Api().getList(url: 'http://192.168.1.12:8081/owners/${userCode}/medical-history/chronic-diseases');
    List<DiseaseModel> diseases= [];

    for(int i = 0; i<data.length;i++){
      diseases.add(DiseaseModel.fromjson(data[i]));
    }
    return diseases;
  }

   Future<List<DiseaseModel>>getAllergies({required String userCode})async{
    List<dynamic>data = await Api().getList(url: 'http://192.168.1.12:8081/owners/${userCode}/medical-history/allergies');
    List<DiseaseModel> diseases= [];

    for(int i = 0; i<data.length;i++){
      diseases.add(DiseaseModel.fromjson(data[i]));
    }
    return diseases;
  }

  Future<List<DiseaseModel>>getImmunizations({required String userCode})async{
    List<dynamic>data = await Api().getList(url: 'http://192.168.1.12:8081/owners/${userCode}/medical-history/immunizations');
    List<DiseaseModel> diseases= [];

    for(int i = 0; i<data.length;i++){
      diseases.add(DiseaseModel.fromjson(data[i]));
    }
    return diseases;
  }
  
}