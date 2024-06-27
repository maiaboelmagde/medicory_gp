import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/allergies_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/disease_pages_hierarchy/diseases_history.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/immunization_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/taken_medicines_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/surgical_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/add_prescription_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/home_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/no_patient_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/medical_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/imaging_results.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/require_imaging.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/adding_tests.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/tests_results_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_info_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_prescriptions.dart';
import 'package:medicory_gp/doctor/doctor_pages/search_for_patient_page.dart';
import 'package:medicory_gp/common/Pages/login_page.dart';
import 'package:medicory_gp/owner/owner_pages/owner_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPatientCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          DocHomePage.id: (context) => const DocHomePage(),
          NoPatientPage.id: (context) => const NoPatientPage(),
          SearchForPatientPage.id: (context) => const SearchForPatientPage(),
          MedicalHistoryPage.id: (context) => const MedicalHistoryPage(),
          PatientInfoPage.id: (context) => const PatientInfoPage(),
          AddPrescriptionPage.id: (context) =>  AddPrescriptionPage(),
          PatientPrescriptions.id : (context)=>PatientPrescriptions(),
          // DiseaseHistoryPage.id: (context) => const DiseaseHistoryPage(),
          TakenMedicinesPage.id: (context) => const TakenMedicinesPage(),
          AllergiesHistoryPage.id: (context) => const AllergiesHistoryPage(),
          SurgicalHistoryPage.id: (context) => const SurgicalHistoryPage(),
          ImmunizationHistoryPage.id: (context) =>
              const ImmunizationHistoryPage(),
          TestsResultsPage.id: (context) => const TestsResultsPage(),
          ImagingResultsPage.id: (context) => const ImagingResultsPage(),
          RequireImagingPage.id: (context) => const RequireImagingPage(),
          AddingTestsPage.id: (context) => AddingTestsPage(),
          OwnerHomePage.id: (context) => OwnerHomePage(),
          PatientPrescriptions.id: (context)=>PatientPrescriptions(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
