import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/allergies_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/disease_pages_hierarchy/diseases_history.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/immunization_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/taken_medicines_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/surgical_history_page.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';

class MedicalHistoryPage extends StatelessWidget {
  static const String id = 'medicalHistoryPage';
  const MedicalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical History page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            CustomButton(
                title: 'Chronic diseases',
                onPressed: () {
                  Navigator.pushNamed(context, DiseaseHistoryPage.id);
                }),
            SizedBox(height: 50,),
            CustomButton(
                title: 'Medicines',
                onPressed: () {
                  Navigator.pushNamed(context, TakenMedicinesPage.id);
                }),
            SizedBox(height: 50,),
            CustomButton(
                title: 'Allergies',
                onPressed: () {
                  Navigator.pushNamed(context, AllergiesHistoryPage.id);
                }),
            SizedBox(height: 50,),
            CustomButton(
                title: 'Surgical history',
                onPressed: () {
                  Navigator.pushNamed(context, SurgicalHistoryPage.id);
                }),
            SizedBox(height: 50,),
            CustomButton(
                title: 'Immunization *',
                onPressed: () {
                  Navigator.pushNamed(context, ImmunizationHistoryPage.id);
                }),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
