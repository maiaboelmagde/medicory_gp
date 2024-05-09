import 'package:flutter/material.dart';
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/imaging_results.dart';
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/required_imaging.dart';
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/required_tests.dart';
import 'package:medicory_gp/Pages/doctor_pages/lab_pages_hierarchy/tests_results_page.dart';
import 'package:medicory_gp/widgets/custom_button.dart';

class DocLabtestsPage extends StatelessWidget {
  static const String id = 'doc_Lab_Tests';
  const DocLabtestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Tests :'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Spacer(flex: 2),
          CustomButton(
              title: 'Tests Results',
              onPressed: () {
                Navigator.pushNamed(context, TestsResultsPage.id);
              }),
          Spacer(flex: 1),
          CustomButton(
              title: 'Imaging Results',
              onPressed: () {
                Navigator.pushNamed(context, ImagingResultsPage.id);
              }),
          Spacer(flex: 1),
          CustomButton(
              title: 'Required Tests',
              onPressed: () {
                Navigator.pushNamed(context, RequiredTestsPage.id);
              }),
          Spacer(flex: 1),
          CustomButton(
              title: 'Imaging (X-rays, atc)',
              onPressed: () {
                Navigator.pushNamed(context, RequiredImagingPage.id);
              }),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
