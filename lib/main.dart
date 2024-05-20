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
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/imaging_results.dart';
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/required_imaging.dart';
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/required_tests.dart';
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/tests_results_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/patient_info_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/search_for_patient_page.dart';
import 'package:medicory_gp/Pages/login_page.dart';
import 'package:medicory_gp/Pages/owner_pages/owner_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        // DocHomePage.id: (context) => const DocHomePage(),
        SearchForPatientPage.id : (context)=> const SearchForPatientPage(),
        MedicalHistoryPage.id: (context) => const MedicalHistoryPage(),
        // PatientInfoPage.id: (context) => const PatientInfoPage(),
        DocLabtestsPage.id: (context) => const DocLabtestsPage(),
        AddPrescriptionPage.id: (context) => const AddPrescriptionPage(),
        DiseaseHistoryPage.id: (context) => const DiseaseHistoryPage(),
        TakenMedicinesPage.id: (context) => const TakenMedicinesPage(),
        AllergiesHistoryPage.id: (context) => const AllergiesHistoryPage(),
        SurgicalHistoryPage.id: (context) => const SurgicalHistoryPage(),
        ImmunizationHistoryPage.id: (context) =>
            const ImmunizationHistoryPage(),
        TestsResultsPage.id: (context) => const TestsResultsPage(),
        ImagingResultsPage.id: (context) => const ImagingResultsPage(),
        RequiredImagingPage.id: (context) => const RequiredImagingPage(),
        RequiredTestsPage.id: (context) => RequiredTestsPage(),
        OwnerHomePage.id: (context) => OwnerHomePage(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
