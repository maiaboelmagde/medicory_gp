import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/disease_pages_hierarchy/add_disease_page.dart';
import 'package:medicory_gp/doctor/models/disease_model.dart';
import 'package:medicory_gp/doctor/services/diseases_services.dart';
import 'package:medicory_gp/doctor/widgets/disease_widget.dart';

class DiseaseHistoryPage extends StatefulWidget {
  static const String id = "DiseaseHistoryPage";
  const DiseaseHistoryPage({super.key, required this.topic});
  final String topic;

  @override
  State<DiseaseHistoryPage> createState() => _DiseaseHistoryPageState(topic: topic);
}

class _DiseaseHistoryPageState extends State<DiseaseHistoryPage> {
  _DiseaseHistoryPageState({required this.topic});
  final String topic;
  bool isLoading = true;
  List<DiseaseModel> diseases = [];

  @override
  void initState() {
    super.initState();

    DiseasesServices(topic: topic)
        .getDiseases(
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
        title: Text(topic+" :"),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(Icons.refresh),
            onTap: () {
              isLoading = true;
              setState(() {});
              DiseasesServices(topic: topic)
                  .getDiseases(
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
                return DiseaseWidget(diseaseInfo: diseases[idx],topic: topic,);
              }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddNewDisease(topic: topic,);
          }));
        },
      ),
    );
  }
}
