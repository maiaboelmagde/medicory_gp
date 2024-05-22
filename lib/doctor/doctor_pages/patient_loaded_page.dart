import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/allergies_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/disease_pages_hierarchy/diseases_history.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/immunization_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/surgical_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/taken_medicines_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/add_prescription_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/doc_labtests_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/medical_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/imaging_results.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/required_imaging.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/required_tests.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/tests_results_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_info_page.dart';
import 'package:medicory_gp/common/models/patient_info_model.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/listed_custom_button.dart';

class PatientLoadedPage extends StatelessWidget {
  static const String id = 'DocPage';
  const PatientLoadedPage({super.key});

  static List<Map<String, dynamic>> medicalHistory = [
    {'title': 'Chronic diseases', 'onPressed': DiseaseHistoryPage.id},
    {'title': 'Medicines', 'onPressed': TakenMedicinesPage.id},
    {'title': 'Allergies', 'onPressed': AllergiesHistoryPage.id},
    {'title': 'Surgical history', 'onPressed': SurgicalHistoryPage.id},
    {'title': 'Immunization *', 'onPressed': ImmunizationHistoryPage.id},
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
                Navigator.pushNamed(context, AddPrescriptionPage.id);
              }),
          SizedBox(
            height: 50,
          ),
          ListedCustomButton(
            title: 'Lab Tests',
            myList: [
              {'title': 'Tests Results', 'onPressed': TestsResultsPage.id},
              {'title': 'Imaging Results', 'onPressed': ImagingResultsPage.id},
              {'title': 'Required Tests', 'onPressed': RequiredTestsPage.id},
              {'title':  'Imaging (X-rays, atc)', 'onPressed': RequiredImagingPage.id},
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
