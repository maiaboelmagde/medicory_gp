import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/require_imaging.dart';
import 'package:medicory_gp/doctor/models/images_model.dart';
import 'package:medicory_gp/doctor/services/images_services.dart';
import 'package:medicory_gp/doctor/widgets/imaging_tests_widget.dart';

class ImagingResultsPage extends StatefulWidget {
  static const String id = "ImagingResultsPage";
  const ImagingResultsPage({super.key,});

  @override
  State<ImagingResultsPage> createState() => _ImagingResultsPageState();
}

class _ImagingResultsPageState extends State<ImagingResultsPage> {
  bool loading = true;
  List<ImagesModel> myTests = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ImagesServices()
        .getImagesHistory(
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
        title: Text("Imaging Tests History :"),
        actions: [
          GestureDetector(
            child: Icon(Icons.refresh),
            onTap: () {
              loading = true;
              setState(() {});
              ImagesServices()
        .getImagesHistory(
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
                return ImagingTestsWidget(myImagingInfo: myTests[indx]);
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RequireImagingPage();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: kColor,
      ),
    );
  }
}
