import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/doctor_pages/search_for_patient_page.dart';

class NoPatientPage extends StatelessWidget {
  const NoPatientPage({super.key});
  static const String id = "NoPatientPage";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("There's no patient"),),
    );
  }
}
