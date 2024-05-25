import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/doctor/models/surgery_model.dart';

class GetSurgeryByIdService{
  Future<SurgeryModel> getSurgery({required num id}) async{
    Map<String, dynamic> data = await Api().getMap(url: 'http://localhost:8081/doctors/patients/surgeries/${id}');
    SurgeryModel surgeryInfo = SurgeryModel.fromjson(data);

    return surgeryInfo;

  }
}