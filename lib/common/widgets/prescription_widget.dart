import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/common/models/prescription_model.dart';
import 'package:medicory_gp/doctor/services/images_services.dart';
import 'package:medicory_gp/doctor/services/prescription_services.dart';
import 'package:medicory_gp/doctor/services/tests_services.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class PrescriptionWidget extends StatefulWidget {
  PrescriptionWidget(
      {super.key, required this.myInfo, required this.beingcreated});
  PrescriptionModel myInfo;
  final bool beingcreated;
  @override
  State<PrescriptionWidget> createState() =>
      _PrescriptionWidgetState(myInfo: myInfo, beingcreated: beingcreated);
}

class _PrescriptionWidgetState extends State<PrescriptionWidget> {
  _PrescriptionWidgetState({required this.myInfo, required this.beingcreated});
  PrescriptionModel myInfo;
  final bool beingcreated;

  bool addingMedicine = false;
  bool addingTest = false;
  bool addingImaging = false;

  @override
  Widget build(BuildContext context) {
    String? medicineName;
    String? Dose;
    num? frequency;
    String? tips;
    String? testName;
    String? testDescription;
    String? ImagingName;
    String? ImagingDescription;
    return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(style: BorderStyle.solid)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              'prescription Info : ',
              style: TextStyle(fontWeight: FontWeight.bold, color: kColor),
            )),
            Text('prescription Id : ' +
                myInfo.prescriptionResponse.prescriptionId.toString()),
            Text("doctor Name : " +
                (myInfo.prescriptionResponse.doctorName ?? '')),
            Text('created at : ' + myInfo.prescriptionResponse.createdAt),
            Text('updated at : ' + myInfo.prescriptionResponse.updatedAt),
            (beingcreated)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'medications Info :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kColor),
                      ),
                      CustomButton(
                          title: 'Add',
                          onPressed: () {
                            addingMedicine = true;
                            setState(() {});
                          })
                    ],
                  )
                : Center(
                    child: Text(
                      'medications Info :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: kColor),
                    ),
                  ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(style: BorderStyle.solid, color: kColor)),
              height: 150,
              child: (myInfo.medications != null &&
                      myInfo.medications!.isNotEmpty)
                  ? ListView.builder(
                      itemCount: myInfo.medications!.length,
                      itemBuilder: (context, indx) {
                        return SizedBox(
                            height: 100,
                            child: ListView(
                              children: [
                                (beingcreated)?
                                Row(
                                  children: [
                                    Text("Medication Name : " +
                                        myInfo.medications![indx].medicineName),
                                    Spacer(),
                                    GestureDetector(
                                      child: Icon(Icons.delete),
                                      onTap: () {
                                        try {
                                          PrescriptionServices()
                                              .deletemedicine(
                                                context,
                                                  id: myInfo
                                                      .medications![indx].id)
                                              .then((value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(value +
                                                        ' , please ,Update the page')));
                                            setState(() {});
                                          });
                                        } on Exception catch (e) {
                                          showSnackBar(context,
                                              ' please ,Update the page');
                                        }
                                      },
                                    )
                                  ],
                                )
                               :  Text("Medication Name : " +
                                        myInfo.medications![indx].medicineName) ,
                                Text(
                                    "Dose : " + myInfo.medications![indx].dose),
                                Text("frequency : " +
                                    myInfo.medications![indx].frequency
                                        .toString()),
                                Text(
                                    "Tips : " + myInfo.medications![indx].tips),
                                Text("-------------------")
                              ],
                            ));
                      })
                  : Text('No medications'),
            ),
            (addingMedicine)
                ? SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        Text('adding new medication'),
                        CustomTextField(
                            title: 'medicineName',
                            onChange: (value) {
                              medicineName = value;
                            }),
                        CustomTextField(
                            title: 'dose',
                            onChange: (value) {
                              Dose = value;
                            }),
                        CustomTextField(
                            title: 'frequency',
                            onChange: (value) {
                              try {
                                frequency = int.parse(value);
                              } on Exception catch (e) {
                                showSnackBar(context,
                                    'You must enter num as a frequency');
                              }
                            }),
                        CustomTextField(
                            title: 'tips',
                            onChange: (value) {
                              tips = value;
                            }),
                        CustomButton(
                            title: 'ADD',
                            onPressed: () {
                              if (medicineName == null) {
                                showSnackBar(context,
                                    'You must write the medicine name');
                              } else if (Dose == null) {
                                showSnackBar(
                                    context, 'You must write the dose');
                              } else if (frequency == null) {
                                showSnackBar(context,
                                    'You must write a num as a frequency');
                              } else {
                                PrescriptionServices()
                                    .addMedicine(
                                        userCode:
                                            BlocProvider.of<GetPatientCubit>(
                                                    context)
                                                .patientInfoModel
                                                .code,
                                        prescriptionId: myInfo
                                            .prescriptionResponse
                                            .prescriptionId,
                                        medicineName: medicineName!,
                                        dose: Dose!,
                                        frequency: frequency!,
                                        tips: tips)
                                    .then((onValue) {
                                  PrescriptionServices()
                                      .getById(
                                          id: myInfo.prescriptionResponse
                                              .prescriptionId)
                                      .then((values) {
                                    myInfo = values;
                                    addingMedicine = false;
                                    setState(() {});
                                  });
                                });
                              }
                            })
                      ],
                    ))
                : Text(''),
            (beingcreated)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lab Tests : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kColor),
                      ),
                      CustomButton(
                          title: 'Add',
                          onPressed: () {
                            addingTest = true;
                            setState(() {});
                          })
                    ],
                  )
                : Center(
                    child: Text(
                      'Lab Tests : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: kColor),
                    ),
                  ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(style: BorderStyle.solid, color: kColor)),
              height: 150,
              child: (myInfo.labTests != null && myInfo.labTests!.isNotEmpty)
                  ? ListView.builder(
                      itemCount: myInfo.labTests!.length,
                      itemBuilder: (context, indx) {
                        return SizedBox(
                            height: 120,
                            child: ListView(
                              children: [
                                (beingcreated)?
                                Row(
                                  children: [
                                    Text("Test Name : " +
                                        myInfo.labTests![indx].name),
                                    Spacer(),
                                    GestureDetector(
                                      child: Icon(Icons.delete),
                                      onTap: () {
                                        try {
                                          TestsServices()
                                              .deleteTest(
                                                context,
                                                  id: myInfo.labTests![indx].id)
                                              .then((value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(value +
                                                        ' , please ,Update the page')));
                                            setState(() {});
                                          });
                                        } on Exception catch (e) {
                                          showSnackBar(context,
                                              ' please ,Update the page');
                                        }
                                      },
                                    )
                                  ],
                                ):
                                Text("Test Name : " +
                                    myInfo.labTests![indx].name),
                                Text("description : " +
                                    myInfo.labTests![indx].description),
                                (myInfo.labTests![indx].testNotes != null &&
                                        myInfo.labTests![indx].testNotes!
                                            .isNotEmpty)
                                    ? Text("Test Notes : " +
                                        myInfo.labTests![indx].testNotes!)
                                    : Text('- No Notes'),
                                (myInfo.labTests![indx].testResult != null &&
                                        myInfo.labTests![indx].testResult!
                                            .isNotEmpty)
                                    ? Text("Test Result : " +
                                        widget
                                            .myInfo.labTests![indx].testResult!)
                                    : Text('- We don\'t have any Results yet'),
                                (myInfo.labTests![indx].updatedAt != null)
                                    ? Text('Updated at : ' +
                                        myInfo.labTests![indx].updatedAt!)
                                    : Text(''),
                                Text("-------------------")
                              ],
                            ));
                      })
                  : Text("There is't any tests required"),
            ),
            (addingTest)
                ? SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        Text('adding new Test'),
                        CustomTextField(
                            title: 'Test Name',
                            onChange: (value) {
                              testName = value;
                            }),
                        CustomTextField(
                            title: 'description',
                            onChange: (value) {
                              testDescription = value;
                            }),
                        CustomButton(
                            title: 'ADD',
                            onPressed: () {
                              if (testName == null) {
                                showSnackBar(
                                    context, 'You must write the Test name');
                              } else if (testDescription == null) {
                                showSnackBar(
                                    context, 'You must write the Description');
                              } else {
                                TestsServices()
                                    .AddNewTest(
                                        code: BlocProvider.of<GetPatientCubit>(
                                                context)
                                            .patientInfoModel
                                            .code,
                                        prescriptionId: myInfo
                                            .prescriptionResponse
                                            .prescriptionId,
                                        name: testName!,
                                        description: testDescription!)
                                    .then((onValue) {
                                  PrescriptionServices()
                                      .getById(
                                          id: myInfo.prescriptionResponse
                                              .prescriptionId)
                                      .then((values) {
                                    myInfo = values;
                                    addingTest = false;
                                    setState(() {});
                                  });
                                });
                              }
                            })
                      ],
                    ))
                : Text(''),
            (beingcreated)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Image Tests : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: kColor),
                      ),
                      CustomButton(
                          title: 'Add',
                          onPressed: () {
                            addingImaging = true;
                            setState(() {});
                          })
                    ],
                  )
                : Center(
                    child: Text(
                      'Imaging Tests :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: kColor),
                    ),
                  ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(style: BorderStyle.solid, color: kColor)),
              height: 150,
              child: (myInfo.imagingTests != null &&
                      myInfo.imagingTests!.isNotEmpty)
                  ? ListView.builder(
                      itemCount: myInfo.imagingTests!.length,
                      itemBuilder: (context, indx) {
                        return SizedBox(
                            height: 120,
                            child: ListView(
                              children: [
                                (beingcreated)?
                                Row(
                                  children: [
                                    Text("Imaging test Name : " +
                                        myInfo.imagingTests![indx].name),
                                    Spacer(),
                                    GestureDetector(
                                      child: Icon(Icons.delete),
                                      onTap: () {
                                        try {
                                          ImagesServices()
                                              .deleteTest(
                                                context,
                                                  id: myInfo.imagingTests![indx].id)
                                              .then((value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(value +
                                                        ' , please ,Update the page')));
                                            setState(() {});
                                          });
                                        } on Exception catch (e) {
                                          showSnackBar(context,
                                              ' please ,Update the page');
                                        }
                                      },
                                    )
                                  ],
                                ):
                                Text(" Name : " +
                                    myInfo.imagingTests![indx].name),
                                Text("description : " +
                                    myInfo.imagingTests![indx].description),
                                (myInfo.imagingTests![indx].resultNotes != null)
                                    ? Text("Test Notes : " +
                                        myInfo.imagingTests![indx].resultNotes!)
                                    : Text('- No Notes'),
                                (myInfo.imagingTests![indx].imageResult != null)
                                    ? Text("Test Result : " +
                                        myInfo.imagingTests![indx].imageResult!)
                                    : Text('- We don\'t have any Results yet'),
                                (myInfo.imagingTests![indx].updatedAt != null)
                                    ? Text('Updated at : ' +
                                        myInfo.imagingTests![indx].updatedAt!)
                                    : Text(''),
                                Text("-------------------")
                              ],
                            ));
                      })
                  : Text("There in't any Imaging required"),
            ),
            (addingImaging)
                ? SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        Text('adding new Imaging'),
                        CustomTextField(
                            title: 'Imaging Name',
                            onChange: (value) {
                              ImagingName = value;
                            }),
                        CustomTextField(
                            title: 'description',
                            onChange: (value) {
                              ImagingDescription = value;
                            }),
                        CustomButton(
                            title: 'ADD',
                            onPressed: () {
                              if (ImagingName == null) {
                                showSnackBar(
                                    context, 'You must write the Imaging name');
                              } else if (ImagingDescription == null) {
                                showSnackBar(
                                    context, 'You must write the Description');
                              } else {
                                ImagesServices()
                                    .AddNewImageTest(
                                  code:
                                      BlocProvider.of<GetPatientCubit>(context)
                                          .patientInfoModel
                                          .code,
                                  prescriptionId: myInfo
                                      .prescriptionResponse.prescriptionId,
                                  name: ImagingName!,
                                  description: ImagingDescription!,
                                )
                                    .then((onValue) {
                                  PrescriptionServices()
                                      .getById(
                                          id: myInfo.prescriptionResponse
                                              .prescriptionId)
                                      .then((values) {
                                    myInfo = values;
                                    addingImaging = false;
                                    setState(() {});
                                  });
                                });
                              }
                            })
                      ],
                    ))
                : Text(''),
          ],
        ));
  }
}
