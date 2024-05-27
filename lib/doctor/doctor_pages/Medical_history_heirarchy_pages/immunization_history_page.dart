import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/add_new_immunization.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/disease_pages_hierarchy/add_disease_page.dart';
import 'package:medicory_gp/doctor/models/disease_model.dart';
import 'package:medicory_gp/doctor/services/diseases_services.dart';
import 'package:medicory_gp/doctor/services/immunizations_services.dart';
import 'package:medicory_gp/doctor/widgets/disease_widget.dart';
import 'package:medicory_gp/doctor/widgets/immunizations_widget.dart';

class ImmunizationHistoryPage extends StatefulWidget {
  static const String id = "DiseaseHistoryPage";
  const ImmunizationHistoryPage({super.key});

  @override
  State<ImmunizationHistoryPage> createState() => _ImmunizationHistoryPageState();
}

class _ImmunizationHistoryPageState extends State<ImmunizationHistoryPage> {
  bool isLoading = true;
  List<DiseaseModel> diseases = [];

  @override
  void initState() {
    super.initState();

    ImmunizationsServices()
        .getimmunizations(
            userCode:
                BlocProvider.of<GetPatientCubit>(context).patientInfoModel.code)
        .then((data) {
      diseases = data;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diseases :"),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(Icons.refresh),
            onTap: () {
              isLoading = true;
              setState(() {});
              ImmunizationsServices()
                  .getimmunizations(
                      userCode: BlocProvider.of<GetPatientCubit>(context)
                          .patientInfoModel
                          .code)
                  .then((value) {
                diseases = value;
                isLoading = false;
                setState(() {});
              });
            },
          )
        ],
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: diseases.length,
              itemBuilder: (context, idx) {
                return immunizationsWidget(diseaseInfo: diseases[idx],);
              }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddNewimmunizations();
          }));
        },
      ),
    );
  }
}
