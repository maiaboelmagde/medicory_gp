import 'package:flutter/material.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/allergies_history_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/diseases_history.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/immunization_history_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/medicines_history_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/surgical_history_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/add_prescription_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/doc_home_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/doc_labtests_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/medical_history_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/patient_info_page.dart';
import 'package:medicory_gp/Pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        DocHomePage.id: (context) => const DocHomePage(),
        MedicalHistoryPage.id: (context) => const MedicalHistoryPage(),
        PatientInfoPage.id: (context) => const PatientInfoPage(),
        DocLabtestsPage.id: (context) => const DocLabtestsPage(),
        AddPrescriptionPage.id: (context) => const AddPrescriptionPage(),
        DiseaseHistoryPage.id: (context) => const DiseaseHistoryPage(),
        MedicinesHistoryPage.id: (context) => const MedicinesHistoryPage(),
        AllergiesHistoryPage.id: (context) => const AllergiesHistoryPage(),
        SurgicalHistoryPage.id: (context) => SurgicalHistoryPage(),
        ImmunizationHistoryPage.id: (context) => ImmunizationHistoryPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
