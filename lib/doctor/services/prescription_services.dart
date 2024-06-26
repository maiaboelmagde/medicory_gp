import 'dart:developer';

import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/doctor/models/prescription_model.dart';

class PrescriptionServices{
  Future<List<PrescriptionModel>> getPatientPrescription ({required String userCode})async{
    List<dynamic> response = await Api().getList(url:'http://localhost:8081/doctors/patients/${userCode}/prescriptions');

    List<PrescriptionModel> Prescriptions = [];
    for(int i=0;i<response.length;i++){
      Prescriptions.add(PrescriptionModel.fromjson(response[i]));
    }

    return Prescriptions;
  }

  
}