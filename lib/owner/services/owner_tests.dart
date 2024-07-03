import 'package:medicory_gp/common/helpers/api.dart';
import 'package:medicory_gp/doctor/models/images_model.dart';
import 'package:medicory_gp/doctor/models/tests_model.dart';

class OwnerTests{
  Future<List<TestsModel>>getAllTests({required String userCode})async{
    List<TestsModel>tests = [];
    List<dynamic>response = await Api().getList(url: 'http://localhost:8081/owners/${userCode}/tests/lab-tests');
    for(int i =0 ;i<response.length;i++){
      tests.add(TestsModel.fromjson(response[i]));
    }
    return tests;
  }
  Future<List<ImagesModel>>getAllImages({required String userCode})async{
    List<ImagesModel>tests = [];
    List<dynamic>response = await Api().getList(url: 'http://localhost:8081/owners/${userCode}/tests/imaging-tests');
    for(int i =0 ;i<response.length;i++){
      tests.add(ImagesModel.fromjson(response[i]));
    }
    return tests;
  }
}