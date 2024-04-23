import 'package:flutter/material.dart';

class PatientInfoContainer extends StatelessWidget {
  final String title;
  final String value;
  const PatientInfoContainer(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
