import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/widgets/patient_info_container.dart';

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage({super.key,});
  static const String id = 'PatientInfoPage';

  @override
  Widget build(BuildContext context) {
    var myInfo = BlocProvider.of<GetPatientCubit>(context).patientInfoModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Informations :',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kColor,
        
         actions: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(360), image: DecorationImage(
                                  image: AssetImage('images/logo.png'),
                                  fit: BoxFit.fill),),
          ),SizedBox(width: 50,),
          
        ],
      ),
      body: ListView(
        
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
