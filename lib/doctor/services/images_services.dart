import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/doctor/models/images_model.dart';

class ImagesServices {
  Future<List<ImagesModel>> getImagesHistory({required String userCode}) async {
    List<dynamic> data = await Api().getList(
        url:
            'http://10.0.2.2:8081/doctors/patients/${userCode}/imaging-tests');

    List<ImagesModel> tests = [];
    for (int i = 0; i < data.length; i++) {
      tests.add(ImagesModel.fromjson(data[i]));
    }

    return tests;
  }

  Future<ImagesModel> getById({required num id}) async {
    Map<String, dynamic> data = await Api().getMap(
        url:
            'http://10.0.2.2:8081/doctors/patients/imaging-tests?testId=${id}');
    ImagesModel testInfo = ImagesModel.fromjson(data);
    return testInfo;
  }

  Future<String> deleteTest( context, {required num id}) async {
    try {
      String data = await Api().deleteReturnString(
          url: 'http://10.0.2.2:8081/doctors/patients/imaging-tests/${id}');
      return data;
    } on Exception catch (e) {
      showSnackBar(context, ' please ,Update the page');
      return '';
    }
  }

  Future<String> AddNewImageTest(
      {required String code,
      required String name,
      required String description,
      String? imageResult,
      String? resultNotes,
      bool? status,
      required num prescriptionId}) async {
    String data = await Api().postGetListReturnString(
        url:
            'http://10.0.2.2:8081/doctors/patients/${code}/imaging-tests?prescriptionId=${prescriptionId}',
        body: [
          {
            'name': name,
            'description': description,
            'imageResult': imageResult ?? '',
            'resultNotes': resultNotes ?? '',
            'status': status ?? true
          }
        ]);
    return data;
  }

  Future<String> update(
      {required num id,
      required String name,
      required String description,
      required String? imageResult,
      required String? resultNotes,
      required bool? status}) async {
    String data = await Api().putString(
        url: 'http://192.168.1.12:8081/doctors/patients/imaging-tests/${id}',
        body: {
          "name": name,
          "description": description,
          'testResult': imageResult ?? '',
          'resultNotes': resultNotes ?? '',
          'status': status ?? true
        });
    return data;
  }
}
