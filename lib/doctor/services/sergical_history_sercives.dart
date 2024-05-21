import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/doctor/models/surgery_model.dart';

class SergicalHistorySercives{
  Future<List<SurgeryModel>>getSurgicalHistory({required String userCode})async {
    List<dynamic> data = await Api().getList(url:  'http://localhost:8081/doctors/patients/${userCode}/surgeries' );

    List<SurgeryModel> surgeries = [];
    for(int i=0;i<data.length;i++){
      surgeries.add(SurgeryModel.fromjson(data[i]));
    }

    return surgeries;
  }
}