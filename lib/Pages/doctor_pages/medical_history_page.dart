import 'package:flutter/material.dart';
import 'package:medicory_gp/widgets/custom_button.dart';

class MedicalHistoryPage extends StatelessWidget {
  final String id = 'medicalHistoryPage';
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
            Spacer(flex: 2),
            CustomButton(title: 'Chronic diseases', onPressed: () {}),
            Spacer(flex: 1),
            CustomButton(title: 'Medicines', onPressed: () {}),
            Spacer(flex: 1),
            CustomButton(title: 'Allergies', onPressed: () {}),
            Spacer(flex: 1),
            CustomButton(title: 'Surgical history', onPressed: () {}),
            Spacer(flex: 1),
            CustomButton(title: 'Immunization *', onPressed: () {}),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
