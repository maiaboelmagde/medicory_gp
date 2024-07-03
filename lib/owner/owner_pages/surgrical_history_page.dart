import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/owner/services/medical_history_services.dart';
import 'package:medicory_gp/owner/widgets/surgery_widget.dart';

class SurgricalHistoryPage extends StatelessWidget {
  const SurgricalHistoryPage({super.key, required this.UserCode});
  final String UserCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Surgeries : '),backgroundColor: kColor,),
      body: FutureBuilder(
          future: MedicalHistoryServices().getAllSurgries(UserCode: UserCode),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, indx) {
                    return SurgeryWidget(
                      surgery: snap.data![indx],
                    );
                  });
            } else {
              if (snap.hasError) {
                showSnackBar(context, snap.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
