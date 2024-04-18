import 'package:flutter/material.dart';
import 'package:medicory_gp/Pages/doctor_pages/medical_history_page.dart';
import 'package:medicory_gp/widgets/custom_button.dart';

class DocHomePage extends StatelessWidget {
  final String id = 'DocPage';
  const DocHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doc home page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(flex: 2),
            CustomButton(title: 'Patient personal info', onPressed: () {}),
            Spacer(flex: 1),
            CustomButton(
                title: 'Medical history',
                onPressed: () {
                  Navigator.pushNamed(context, MedicalHistoryPage().id);
                }),
            Spacer(flex: 1),
            CustomButton(title: 'The prescription', onPressed: () {}),
            Spacer(flex: 1),
            CustomButton(title: 'Lab Tests', onPressed: () {}),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
