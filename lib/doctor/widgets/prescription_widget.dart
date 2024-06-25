import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/models/prescription_model.dart';

class PrescriptionWidget extends StatelessWidget {
  const PrescriptionWidget({super.key, required this.myInfo});
  final PrescriptionModel myInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.8),
          border: Border.all(style: BorderStyle.solid)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'prescription Info :',
            style: TextStyle(fontWeight: FontWeight.bold , color: kColor),
          )),
          Text('prescription Id : ' +
              myInfo.prescriptionResponse.prescriptionId.toString()),
          Text("doctor Name : " +
              (myInfo.prescriptionResponse.doctorName ?? '')),
          Text('created at : ' + myInfo.prescriptionResponse.createdAt),
          Text('updated at : ' + myInfo.prescriptionResponse.updatedAt),
          Center(
              child: Text(
            'medications Info :',
            style: TextStyle(fontWeight: FontWeight.bold, color: kColor),
          )),
          Container(
            padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.8),
          border: Border.all(style: BorderStyle.solid,color: kColor)),
            height: 150,
            child: ListView.builder(
                itemCount: myInfo.medications.length,
                itemBuilder: (context, indx) {
                  return SizedBox(
                      height: 100,
                      child: ListView(
                        children: [
                          Text("Medication Name : " +
                              myInfo.medications[indx].medicineName),
                          Text("Dose : " + myInfo.medications[indx].dose),
                          Text("frequency : "+ myInfo.medications[indx].frequency.toString()),
                          Text("Tips : " + myInfo.medications[indx].tips),
                          Text("-------------------")
                        ],
                      ));
                }),
          ),
          (myInfo.labTests != null)?
           Column(
             children: [
              Text(
            'Lab Tests :',
            style: TextStyle(fontWeight: FontWeight.bold, color: kColor),
          ),
               Container(
                padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.8),
          border: Border.all(style: BorderStyle.solid,color: kColor)),
                height: 150,
                child: ListView.builder(
                    itemCount: myInfo.labTests!.length,
                    itemBuilder: (context, indx) {
                      return SizedBox(
                          height: 120,
                          child: ListView(
                            children: [
                              Text("Test Name : " +
                                  myInfo.labTests![indx].name),
                              Text("description : " + myInfo.labTests![indx].description),
                              (myInfo.labTests![indx].testNotes != null)?
                              Text("Test Notes : "+ myInfo.labTests![indx].testNotes!):Text('- No Notes'),
                              (myInfo.labTests![indx].testResult != null)?
                              Text("Test Result : " + myInfo.labTests![indx].testResult!): Text('- We don\'t have any Results yet') ,
                              (myInfo.labTests![indx].updatedAt !=  null)?
                              Text('Updated at : ' + myInfo.labTests![indx].updatedAt!): Text('') ,
                              Text("-------------------")
                            ],
                          ));
                    }),
                         ),
             ],
           ): Text("There in't any tests required"),
          (myInfo.imagingTests != null)?
           Column(
             children: [
               Text(
            'Imaging Tests :',
            style: TextStyle(fontWeight: FontWeight.bold,color: kColor),
          ),
               Container(
                padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.8),
          border: Border.all(style: BorderStyle.solid,color: kColor)),
                height: 150,
                child: ListView.builder(
                    itemCount: myInfo.imagingTests!.length,
                    itemBuilder: (context, indx) {
                      return SizedBox(
                          height: 120,
                          child: ListView(
                            children: [
                              Text(" Name : " +
                                  myInfo.imagingTests![indx].name),
                              Text("description : " + myInfo.imagingTests![indx].description),
                              (myInfo.imagingTests![indx].resultNotes != null)?
                              Text("Test Notes : "+ myInfo.imagingTests![indx].resultNotes!):Text('- No Notes'),
                              (myInfo.imagingTests![indx].imageResult != null)?
                              Text("Test Result : " + myInfo.imagingTests![indx].imageResult!): Text('- We don\'t have any Results yet') ,
                              (myInfo.imagingTests![indx].updatedAt !=  null)?
                              Text('Updated at : ' + myInfo.imagingTests![indx].updatedAt!): Text('') ,
                              Text("-------------------")
                            ],
                          ));
                    }),
                         ),
             ],
           ): Text("There in't any Imaging required")
        ],
      ),
    );
  }
}
