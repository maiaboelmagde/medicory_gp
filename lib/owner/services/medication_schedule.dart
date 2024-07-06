import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/owner/models/medicine_model.dart';

class MedicationSchedule{
  Future<List<MedicineModel>?> getMedicationSchedule({required String userCode})async{
  
   
    List<MedicineModel> medicines = [];
    try{
      List<dynamic> response = await Api().getList(url: 'http://192.168.1.12:8081/owners/${userCode}/medication-schedule');
      print(response);
      for (int i = 0; i < response.length; i++ ){
        medicines.add(MedicineModel.fromjson(response[i]));
      }
       
      return medicines;
    }on Exception catch(e){
      print(e);
    }
}
}