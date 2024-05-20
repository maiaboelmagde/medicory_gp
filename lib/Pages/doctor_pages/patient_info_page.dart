import 'package:flutter/material.dart';
import 'package:medicory_gp/models/patient_info_model.dart';
import 'package:medicory_gp/widgets/patient_info_container.dart';

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage({super.key, required this.myInfo});
  static const String id = 'PatientInfoPage';
  final PatientInfoModel myInfo;

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
          PatientInfoContainer(title: 'Name : ', value: myInfo.name),
          PatientInfoContainer(title: 'Age : ', value: myInfo.age.toString()),
          PatientInfoContainer(title: 'Gender : ', value: myInfo.gender),
          PatientInfoContainer(title: 'Phone Number: ', value: myInfo.phoneNumbers),
          PatientInfoContainer(
              title: 'Relative phone number : ', value: myInfo.relativePhoneNumbers),
          PatientInfoContainer(title: 'Address : ', value: myInfo.address),
          PatientInfoContainer(title: 'E-mail : ', value: myInfo.email),
        ],
      ),
    );
  }
}
