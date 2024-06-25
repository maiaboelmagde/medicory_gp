import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/add_new_surgery.dart';
import 'package:medicory_gp/doctor/models/surgery_model.dart';
import 'package:medicory_gp/doctor/services/surgeries_services.dart';
import 'package:medicory_gp/doctor/widgets/surgery_widget.dart';

class SurgicalHistoryPage extends StatefulWidget {
  static const String id = "SurgicalHistoryPage";
  const SurgicalHistoryPage({super.key});

  @override
  State<SurgicalHistoryPage> createState() => _SurgicalHistoryPageState();
}

class _SurgicalHistoryPageState extends State<SurgicalHistoryPage> {
  bool loading = true;
  List<SurgeryModel> mySurgeries = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SurgeriesServices()
        .getSurgicalHistory(
            userCode:
                BlocProvider.of<GetPatientCubit>(context).patientInfoModel.code)
        .then((value) {
      mySurgeries = value;
      loading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surgical History :"),
        actions: [
          GestureDetector(
            child: Icon(Icons.refresh),
            onTap: () {
              loading = true;
              setState(() {});
              SurgeriesServices()
                  .getSurgicalHistory(
                      userCode: BlocProvider.of<GetPatientCubit>(context)
                          .patientInfoModel
                          .code)
                  .then((value) {
                mySurgeries = value;
                loading = false;
                setState(() {});
              });
            },
          )
        ],
      ),
      body: (loading == false)
          ? ListView.builder(
              itemCount: mySurgeries.length,
              itemBuilder: (context, indx) {
                return SurgeryWidget(surgeryInfo: mySurgeries[indx]);
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddNewSurgery();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: kColor,
      ),
    );
  }
}
