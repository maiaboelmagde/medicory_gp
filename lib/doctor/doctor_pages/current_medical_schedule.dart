import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/owner/services/medication_schedule.dart';
import 'package:medicory_gp/owner/widgets/medication_schedule_widget.dart';

class CurrentMedicalSchedulePage extends StatelessWidget {
  const CurrentMedicalSchedulePage({super.key, });
 
  static final String id = 'CurrentMedicalSchedulePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text('Current Medical Schedule page'),
      ),
      body: FutureBuilder(
          future: MedicationSchedule()
              .getMedicationSchedule(userCode:BlocProvider.of<GetPatientCubit>(context)
                .patientInfoModel
                .code),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, indx) {
                    return MedicationScheduleWidget(medicine: snap.data![indx]);
                  });
            } else if (snap.hasError) {
              print(snap.error);
                  return Center(child: Text("This owner doesn't have current medication schedule!"));
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
     
    );
  }
}
