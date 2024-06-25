import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/add_new_surgery.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/required_tests.dart';
import 'package:medicory_gp/doctor/models/surgery_model.dart';
import 'package:medicory_gp/doctor/models/tests_model.dart';
import 'package:medicory_gp/doctor/services/surgeries_services.dart';
import 'package:medicory_gp/doctor/services/tests_services.dart';
import 'package:medicory_gp/doctor/widgets/surgery_widget.dart';
import 'package:medicory_gp/doctor/widgets/tests_widget.dart';

class TestsResultsPage extends StatefulWidget {
  static const String id = "TestsResultsPage";
  const TestsResultsPage({super.key});

  @override
  State<TestsResultsPage> createState() => _TestsResultsPageState();
}

class _TestsResultsPageState extends State<TestsResultsPage> {
  bool loading = true;
  List<TestsModel> myTests = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TestsServices()
        .getTestsHistory(
            userCode:
                BlocProvider.of<GetPatientCubit>(context).patientInfoModel.code)
        .then((value) {
      myTests = value;
      loading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tests History :"),
        actions: [
          GestureDetector(
            child: Icon(Icons.refresh),
            onTap: () {
              loading = true;
              setState(() {});
              TestsServices()
        .getTestsHistory(
                      userCode: BlocProvider.of<GetPatientCubit>(context)
                          .patientInfoModel
                          .code)
                  .then((value) {
                myTests = value;
                loading = false;
                setState(() {});
              });
            },
          )
        ],
      ),
      body: (loading == false)
          ? ListView.builder(
              itemCount: myTests.length,
              itemBuilder: (context, indx) {
                return TestsWidget(testInfo: myTests[indx]);
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RequiredTestsPage();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: kColor,
      ),
    );
  }
}
