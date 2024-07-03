import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/models/prescription_model.dart';

class MedicationSchedule{
  Future<List<medication>?> getMedicationSchedule({required String userCode})async{
    List<dynamic> response ;
    List<medication> medicines = [];
    // try{
      response = await Api().getList(url: 'http://localhost:8081/owners/${userCode}/medication-schedule');
      for (int i = 0; i < response.length; i++ ){
        medicines.add(response[i]);
      }
      return medicines;
    // }on Exception catch(e){
    //   print(e);
    // }
}
}