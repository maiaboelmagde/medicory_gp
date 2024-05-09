import 'package:flutter/material.dart';
import 'package:medicory_gp/widgets/patient_info_container.dart';

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage({super.key});
  static const String id = 'PatientInfoPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Informations :',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PatientInfoContainer(title: 'Name : ', value: '       '),
          PatientInfoContainer(title: 'Age : ', value: '       '),
          PatientInfoContainer(title: 'Gender : ', value: '       '),
          PatientInfoContainer(title: 'Phone Number: ', value: '       '),
          PatientInfoContainer(
              title: 'Relative phone number : ', value: '       '),
          PatientInfoContainer(title: 'Address : ', value: '       '),
          PatientInfoContainer(title: 'E-mail : ', value: '       '),
        ],
      ),
    );
  }
}
