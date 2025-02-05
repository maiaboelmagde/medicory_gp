import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/allergies_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/disease_pages_hierarchy/diseases_history.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/immunization_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/surgical_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/taken_medicines_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/add_prescription_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/medical_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/current_medical_schedule.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/imaging_results.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/require_imaging.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/adding_tests.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/tests_results_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_info_page.dart';
import 'package:medicory_gp/common/models/patient_info_model.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_prescriptions.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/listed_custom_button.dart';
import 'package:medicory_gp/owner/owner_pages/medical_schedule_page.dart';

class PatientLoadedPage extends StatelessWidget {
  static const String id = 'DocPage';
  const PatientLoadedPage({super.key});

  static List<Map<String, dynamic>> medicalHistory = [
    {'title': 'Chronic diseases', 'onPressed': DiseaseHistoryPage(topic: 'chronic-diseases' ,),'method': 'notnamed'},
    // {'title': 'Medicines', 'onPressed': TakenMedicinesPage.id,'method': 'named'},
    {'title': 'Allergies', 'onPressed': DiseaseHistoryPage(topic: 'allergies' ,) ,'method': 'notnamed'},
    {'title': 'Surgical history', 'onPressed': SurgicalHistoryPage.id,'method': 'named'},
    {'title': 'Immunization *', 'onPressed': DiseaseHistoryPage(topic: 'immunizations' ,),'method': 'notnamed'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomButton(
              title: 'Patient personal info',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PatientInfoPage();
                }));
              }),
          SizedBox(
            height: 50,
          ),
          CustomButton(
              title: 'Current Schedule',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CurrentMedicalSchedulePage();
                }));
              }),
          SizedBox(
            height: 50,
          ),
          ListedCustomButton(
            title: 'Medical history',
            myList: medicalHistory,
            // onPressed: () {
            //   Navigator.pushNamed(context, MedicalHistoryPage.id);
            // }
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
              title: 'The prescription',
              onPressed: () {
                Navigator.pushNamed(context, PatientPrescriptions.id);
              }),
          SizedBox(
            height: 50,
          ),
          ListedCustomButton(
            title: 'Lab Tests',
            myList: [
              {'title': 'Tests Results', 'onPressed': TestsResultsPage.id, 'method': 'named'},
              {'title': 'Imaging Results', 'onPressed': ImagingResultsPage.id, 'method': 'named'},
              // {'title': 'Required Tests', 'onPressed': AddingTestsPage.id, 'method': 'named'},
              // {'title':  'Imaging (X-rays, atc)', 'onPressed': RequireImagingPage.id, 'method': 'named'},
            ],
            // onPressed: () {
            //   Navigator.pushNamed(context, DocLabtestsPage.id);
            // }
          ),
          SizedBox(
            height: 50,
          ),
          
        ],
      ),
    );
  }
}
