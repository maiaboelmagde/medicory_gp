import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/doctor_pages/add_prescription_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/doc_labtests_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/medical_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_info_page.dart';
import 'package:medicory_gp/common/models/patient_info_model.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';

class PatientLoadedPage extends StatelessWidget {
  static const String id = 'DocPage';
  const PatientLoadedPage({super.key });

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(flex: 2),
            CustomButton(
                title: 'Patient personal info',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PatientInfoPage();
                  }));
                }),
            Spacer(flex: 1),
            CustomButton(
                title: 'Medical history',
                onPressed: () {
                  Navigator.pushNamed(context, MedicalHistoryPage.id);
                }),
            Spacer(flex: 1),
            CustomButton(
                title: 'The prescription',
                onPressed: () {
                  Navigator.pushNamed(context, AddPrescriptionPage.id);
                }),
            Spacer(flex: 1),
            CustomButton(
                title: 'Lab Tests',
                onPressed: () {
                  Navigator.pushNamed(context, DocLabtestsPage.id);
                }),
            Spacer(flex: 2),
          ],
        ),
    );
  }
}
