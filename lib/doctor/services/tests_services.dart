
import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/doctor/models/tests_model.dart';

class TestsServices{
   Future<List<TestsModel>>getTestsHistory({required String userCode})async {
    List<dynamic> data = await Api().getList(url: 'http://localhost:8081/doctors/patients/${userCode}/tests');

    List<TestsModel> tests = [];
    for(int i=0;i<data.length;i++){
      tests.add(TestsModel.fromjson(data[i]));
    }

    return tests;
  }

  Future<TestsModel> getTest({required num id}) async{
    Map<String, dynamic> data = await Api().getMap(url: 'http://localhost:8081/doctors/patients/tests?testId=${id}');
    TestsModel testInfo = TestsModel.fromjson(data);
    return testInfo;
  }


   Future<String>deleteTest({required num id})async{
    String data = await Api().deleteReturnString(url: 'http://localhost:8081/doctors/patients/tests/${id}');
    return data;
  }


   Future<String> AddNewTest(
      {required String code,
      required String name,
      required String description,
      required String imageResult,
      required String resultNotes,
      required bool status
      }) async {
    String data = await Api().postReturnString(
        url: 'http://localhost:8081/doctors/patients/${code}/tests',
        body: {'name': name, 'description': description, 'imageResult': imageResult, 'resultNotes' : resultNotes, 'status': status});
    return data;
  }

   Future<String> update(
      {required String userCode,
      required num id,
      required String name,
      required String description,
      required String imageResult,
      required String resultNotes,
      required bool status
      }) async {
    String data = await Api().putString(
        url:
            'http://localhost:8081/doctors/patients/tests/${id}',
        body: {"name": name, "description": description, 'imageResult': imageResult, 'resultNotes': resultNotes, 'status': status});
    return data;
  }
}