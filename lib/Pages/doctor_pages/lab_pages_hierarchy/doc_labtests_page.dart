import 'package:flutter/material.dart';
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
          CustomButton(title: 'Lab Results', onPressed: () {}),
          Spacer(flex: 1),
          CustomButton(title: 'Required Tests', onPressed: () {}),
          Spacer(flex: 1),
          CustomButton(title: 'Imaging (X-rays, atc)', onPressed: () {}),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
