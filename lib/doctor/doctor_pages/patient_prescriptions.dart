import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/doctor_pages/add_prescription_page.dart';
import 'package:medicory_gp/doctor/services/prescription_services.dart';
import 'package:medicory_gp/common/widgets/prescription_widget.dart';

class PatientPrescriptions extends StatelessWidget {
  const PatientPrescriptions({super.key});
  static final String id = 'PatientPrescriptions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Prescriptions",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
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
          ),
          
        ]
      ),
      body: FutureBuilder(
        future: PrescriptionServices().getPatientPrescription(
            userCode: BlocProvider.of<GetPatientCubit>(context)
                .patientInfoModel
                .code),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            

            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, idx) {
                  return PrescriptionWidget(myInfo: snapshot.data![idx],beingcreated: false,);
                });
          }else if(snapshot.hasError){
            print(snapshot.error);
            return Text(snapshot.error.toString() ?? 'Errrroorrrrrrr');
          }
           else {
            return CircularProgressIndicator();
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddPrescriptionPage();
          }));
        },
        child: Icon(Icons.add),
        backgroundColor: kColor,
      ),
    );
  }
}
