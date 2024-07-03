import 'package:flutter/material.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';
import 'package:medicory_gp/owner/services/medication_schedule.dart';
import 'package:medicory_gp/owner/widgets/medication_schedule_widget.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class MedicalSchedulePage extends StatelessWidget {
  const MedicalSchedulePage({super.key, required this.ownerCode});
  final OwnerModel ownerCode;
  static final String id = 'MedicalSchedulePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Schedule page'),
      ),
      body: FutureBuilder(
          future: MedicationSchedule()
              .getMedicationSchedule(userCode: ownerCode.code),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, indx) {
                    return MedicationScheduleWidget(medicine: snap.data![indx]);
                  });
            } else if (snap.hasError) {
              
                  return Center(child: Text("This owner doesn't have current medication schedule!"));
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          }),
      bottomNavigationBar: OwnerbottomNavigationBar(
        ownerCode: ownerCode,
      ),
    );
  }
}
