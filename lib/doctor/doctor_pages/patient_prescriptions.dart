import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/services/prescription_services.dart';
import 'package:medicory_gp/doctor/widgets/prescription_widget.dart';

class PatientPrescriptions extends StatelessWidget {
  const PatientPrescriptions({super.key});
  static final String id = 'PatientPrescriptions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Prescriptions"),
      ),
      body: FutureBuilder(
        future: PrescriptionServices().getPatientPrescription(
            userCode: BlocProvider.of<GetPatientCubit>(context)
                .patientInfoModel
                .code),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, idx) {
                  return PrescriptionWidget(myInfo: snapshot.data![idx]);
                });
          }else if(snapshot.hasError){
            print(snapshot.error);
            return Text(snapshot.error.toString() ?? 'Errrroorrrrrrr');
          }
           else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
