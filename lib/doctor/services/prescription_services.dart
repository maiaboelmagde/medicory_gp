import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/doctor/models/images_model.dart';
import 'package:medicory_gp/common/models/prescription_model.dart';
import 'package:medicory_gp/doctor/models/tests_model.dart';

class PrescriptionServices {
  Future<List<PrescriptionModel>> getPatientPrescription(
      {required String userCode}) async {
    List<dynamic> response = await Api().getList(
        url:
            'http://192.168.1.12:8081/doctors/patients/${userCode}/prescriptions');

    List<PrescriptionModel> Prescriptions = [];
    for (int i = 0; i < response.length; i++) {
      Prescriptions.add(PrescriptionModel.fromjson(response[i]));
    }

    return Prescriptions;
  }

  Future<num> addService(
      {required String userCode,
      required List<medication> medications,
      required List<TestsModel> tests,
      required List<ImagesModel> images}) async {
    Map<String, dynamic> body = {
      "medications": medications,
      "labTests": tests,
      "imagingTests": images
    };
    num response = await Api().postReturnNum(
        url: 'http://192.168.1.12:8081/doctors/patients/${userCode}/prescriptions',
        body: body);
    return response;
  }

  Future<PrescriptionModel> getById({required num id}) async {
    Map<String, dynamic> prescription = await Api().getMap(
        url:
            'http://192.168.1.12:8081/doctors/patients/prescriptions?prescriptionId=${id}');
    PrescriptionModel myPrescription = PrescriptionModel.fromjson(prescription);
    return myPrescription;
  }

  Future<String> addMedicine(
      {required String userCode,
      required num prescriptionId,
      required String medicineName,
      required String dose,
      required num frequency,
      String? tips}) async {
    List<Map<String, dynamic>> body = [
      {
        "medicineName": medicineName,
        "dose": dose,
        "frequency": frequency,
        "sideEffects": '',
        "tips": tips
      }
    ];
    String response = await Api().postGetListReturnString(
      url:
          'http://192.168.1.12:8081/doctors/patients/${userCode}/medications?prescriptionId=${prescriptionId}',
      body: body,
    );

    return response;
  }

  Future<String> deletemedicine(context, {required num id}) async {
    try {
      String data = await Api().deleteReturnString(
          url: 'http://192.168.1.12:8081/doctors/patients/medications/${id}');
      return data;
    } on Exception catch (e) {
      showSnackBar(context, ' please ,Update the page');
      return '';
    }
  }
}
