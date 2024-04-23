import 'package:flutter/material.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/allergies_history_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/disease_pages_hierarchy/diseases_history.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/immunization_history_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/taken_medicines_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/surgical_history_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/add_prescription_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/doc_home_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/doc_labtests_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/medical_history_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/tests_results_page.dart';
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
        TakenMedicinesPage.id: (context) => const TakenMedicinesPage(),
        AllergiesHistoryPage.id: (context) => const AllergiesHistoryPage(),
        SurgicalHistoryPage.id: (context) => const SurgicalHistoryPage(),
        ImmunizationHistoryPage.id: (context) =>
            const ImmunizationHistoryPage(),
        TestsResultsPage.id: (context) => const TestsResultsPage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
