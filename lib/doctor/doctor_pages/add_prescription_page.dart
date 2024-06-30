
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/common/models/prescription_model.dart';
import 'package:medicory_gp/doctor/services/prescription_services.dart';
import 'package:medicory_gp/common/widgets/prescription_widget.dart';

class AddPrescriptionPage extends StatefulWidget {
  static const String id = "AddPrescriptionPage";
   AddPrescriptionPage({super.key,});


  @override
  State<AddPrescriptionPage> createState() => _AddPrescriptionPageState();
}

class _AddPrescriptionPageState extends State<AddPrescriptionPage> {
  late num myPrescriptionID;
  late PrescriptionModel myPrescription;
  bool loading = true;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    PrescriptionServices().addService(userCode: 
                BlocProvider.of<GetPatientCubit>(context).patientInfoModel.code
        , medications: [], tests: [], images: []).then((onValue){
          myPrescriptionID = onValue;
          PrescriptionServices().getById(id: onValue).then((onValue){
            myPrescription = onValue;
            loading = false;
          setState(() {
            
          });
          });
          
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Prescription :"),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(Icons.refresh),
            onTap: () {
              loading = true;
              setState(() {});
              PrescriptionServices()
                  .getById(
                       id: myPrescriptionID)
                  .then((value) {
                myPrescription = value;
                loading = false;
                setState(() {});
              });
            },
          )
        ],
      ),
      body:(loading)?
      Center(child: CircularProgressIndicator())
      :ListView(
        children: [
          PrescriptionWidget(myInfo: myPrescription, beingcreated: true,),
        ],
      )
     
    );
  }
}
