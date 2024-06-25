import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_prescriptions.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';
import 'package:medicory_gp/doctor/widgets/search_textfield.dart';

class AddPrescriptionPage extends StatelessWidget {
  static const String id = "AddPrescriptionPage";
  const AddPrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Prescription :"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          
          children: [
            CustomButton(
                title: 'View Previous prescriptions ->',
                onPressed: () {
                  Navigator.pushNamed(context, PatientPrescriptions.id);
                },),
            CustomTextField(title: 'Prescription', onChange: (value){}),
            SizedBox(
              height: 20,
            ),
            CustomButton(
                title: 'ADD',
                onPressed: () {},
              ),
            
          ],
        ),
      ),
    );
  }
}
