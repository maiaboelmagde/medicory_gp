

import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/doctor_pages/add_prescription_page.dart';
import 'package:medicory_gp/doctor/services/prescription_services.dart';
import 'package:medicory_gp/common/widgets/prescription_widget.dart';

class PrescriptionsPage extends StatelessWidget {
  const PrescriptionsPage({super.key, required this.usercode} );
  final String usercode;
  static final String id = 'PatientPrescriptions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prescriptions : "),
      ),
      body: FutureBuilder(
        future: PrescriptionServices().getPatientPrescription(
            userCode: usercode),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, idx) {
                  return PrescriptionWidget(myInfo: snapshot.data![idx],beingcreated: false,);
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
