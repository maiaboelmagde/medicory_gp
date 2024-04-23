import 'package:flutter/material.dart';

class DiseaseDetailsPage extends StatelessWidget {
  static final String id = "DiseaseDetailsPage";
  final String title;
  const DiseaseDetailsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Disease Details :"),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Disease name : '),
            Spacer(flex: 1),
            Text('Date of diagnosis : '),
            Spacer(flex: 1),
            Text('Current status or severity level : '),
            Spacer(flex: 1),
            Text('Treatment plan : '),
            Spacer(flex: 1),
            Text('Additional notes : '),
            Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}
