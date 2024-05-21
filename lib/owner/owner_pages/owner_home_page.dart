import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/doctor_pages/add_prescription_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/doc_labtests_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/medical_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/tests_results_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_info_page.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/search_textfield.dart';

class OwnerHomePage extends StatelessWidget {
  static const String id = 'OwnerHomePage';
  const OwnerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Home Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(flex: 2),
            SearchTextField(onchange: (data) {}),
            Spacer(flex: 1),
            CustomButton(title: 'Current Medical Schedule', onPressed: () {}),
            Spacer(flex: 1),
            CustomButton(
                title: 'Medical history',
                onPressed: () {
                  Navigator.pushNamed(context, MedicalHistoryPage.id);
                }),
            Spacer(flex: 1),
            CustomButton(
                title: 'Tests Results',
                onPressed: () {
                  Navigator.pushNamed(context, TestsResultsPage.id);
                }),
            Spacer(flex: 1),
            CustomButton(
                title: 'Personal Information',
                onPressed: () {
                  Navigator.pushNamed(context, PatientInfoPage.id);
                }),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
