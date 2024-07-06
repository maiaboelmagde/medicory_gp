import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/doctor/models/tests_model.dart';

class TestsServices {
  Future<List<TestsModel>> getTestsHistory({required String userCode}) async {
    List<dynamic> data = await Api().getList(
        url: 'http://192.168.1.12:8081/doctors/patients/${userCode}/tests');

    List<TestsModel> tests = [];
    for (int i = 0; i < data.length; i++) {
      tests.add(TestsModel.fromjson(data[i]));
    }

    return tests;
  }

  Future<TestsModel> getTest({required num id}) async {
    Map<String, dynamic> data = await Api().getMap(
        url: 'http://192.168.1.12:8081/doctors/patients/tests?testId=${id}');
    TestsModel testInfo = TestsModel.fromjson(data);
    return testInfo;
  }

  Future<String> deleteTest(context,{required num id}) async {
    try {
  String data = await Api().deleteReturnString(
      url: 'http://192.168.1.12:8081/doctors/patients/tests/${id}');
  return data;
} on Exception catch (e) {
  showSnackBar(context, ' please ,Update the page');
      return '';
  }
  }
  Future<String> AddNewTest(
      {required String code,
      required String name,
      required String description,
      String? imageResult,
      String? resultNotes,
      
      required num prescriptionId}) async {
    String data = await Api().postGetListReturnString(
        url:
            'http://192.168.1.12:8081/doctors/patients/${code}/tests?prescriptionId=${prescriptionId}',
        body: [{
          'name': name,
          'description': description,
          'imageResult': imageResult ??'',
          'resultNotes': resultNotes ?? '',
          'status': true
        }]);
    return data;
  }

  Future<String> update(
      {required String userCode,
      required num id,
      required String name,
      required String description,
      required String testResult,
      required String resultNotes,
      required bool status}) async {
    String data = await Api().putString(
        url: 'http://192.168.1.12:8081/doctors/patients/tests/${id}',
        body: {
          "name": name,
          "description": description,
          'testResult': testResult,
          'resultNotes': resultNotes,
          'status': status
        });
    return data;
  }
}
