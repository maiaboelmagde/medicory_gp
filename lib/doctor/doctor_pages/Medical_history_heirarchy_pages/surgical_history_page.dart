import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/models/surgery_model.dart';
import 'package:medicory_gp/doctor/services/sergical_history_sercives.dart';
import 'package:medicory_gp/doctor/widgets/surgery_widget.dart';

class SurgicalHistoryPage extends StatelessWidget {
  static const String id = "SurgicalHistoryPage";
  const SurgicalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surgical History :"),
      ),
      body: FutureBuilder(
          future: SergicalHistorySercives().getSurgicalHistory(
              userCode: BlocProvider.of<GetPatientCubit>(context)
                  .patientInfoModel
                  .code),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                  itemCount: snap.data?.length,
                  itemBuilder: (context, indx) {
                    return SurgeryWidget(
                        surgeryInfo: snap.data?[indx] ??
                            SurgeryModel(
                              id: -1,
                                createdAt: '',
                                updatedAt: '',
                                name: '',
                                description: ''));
                  });
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
