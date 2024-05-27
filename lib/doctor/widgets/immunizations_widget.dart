import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/models/disease_model.dart';
import 'package:medicory_gp/doctor/models/surgery_model.dart';
import 'package:medicory_gp/doctor/services/diseases_services.dart';
import 'package:medicory_gp/doctor/services/immunizations_services.dart';
import 'package:medicory_gp/doctor/services/surgeries_services.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class immunizationsWidget extends StatefulWidget {
  const immunizationsWidget({super.key, required this.diseaseInfo});
  final DiseaseModel diseaseInfo;

  @override
  State<immunizationsWidget> createState() =>
      _immunizationsWidgetState(myInfo: diseaseInfo);
}

class _immunizationsWidgetState extends State<immunizationsWidget> {
  _immunizationsWidgetState({required this.myInfo});
  DiseaseModel myInfo;
  bool loading = false;
  bool flag = true;
  bool update_flag = false;
  String? newName;
  String? newInformation;

  @override
  Widget build(BuildContext context) {
    return (loading)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : (flag == true)
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    Text(
                      myInfo.name,
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                      onPressed: () {
                        flag = false;
                        setState(() {});
                      },
                      icon: Icon(Icons.arrow_drop_down),
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () {
                        ImmunizationsServices()
                            .deleteimmunization(id: myInfo.id)
                            .then((value) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(value + ' , please ,Update the page')));
                              setState(() {
                                
                              });
                          
                        });
                      },
                    )
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          myInfo.name,
                          style: TextStyle(fontSize: 15),
                        ),
                        IconButton(
                          onPressed: () {
                            flag = true;
                            setState(() {});
                          },
                          icon: Icon(Icons.arrow_drop_up),
                        ),
                         Spacer(),
                    GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () {
                        ImmunizationsServices()
                            .deleteimmunization(id: myInfo.id)
                            .then((value) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(value + ' , please ,Update the page')));
                              setState(() {
                                
                              });
                          
                        });
                      },
                    )
                      ],
                    ),
                    Text('Created at : ' + myInfo.createdAt),
                    Text('Updated at : ' + myInfo.updatedAt),
                    Text("Description : " + myInfo.information),
                    (update_flag)
                        ? SizedBox(
                            height: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('New Name : '),
                                CustomTextField(
                                  title: 'Name',
                                  onChange: (value) {
                                    newName = value;
                                  },
                                ),
                                Text('New Description : '),
                                CustomTextField(
                                  title: 'Description',
                                  onChange: (value) {
                                    newInformation = value;
                                  },
                                ),
                                CustomButton(
                                    title: 'Update',
                                    onPressed: () async {
                                      loading = true;
                                      setState(() {});
                                      ImmunizationsServices()
                                          .update(
                                              userCode: BlocProvider.of<
                                                      GetPatientCubit>(context)
                                                  .patientInfoModel
                                                  .code,
                                              id: myInfo.id,
                                              name: newName ?? myInfo.name,
                                              information: newInformation ??
                                                  myInfo.information)
                                          .then((value) {
                                        ImmunizationsServices()
                                            .getimmunizationById(id: myInfo.id)
                                            .then((data) {
                                          myInfo = data;
                                          loading = false;
                                          update_flag = false;
                                          setState(() {});
                                        });
                                      });
                                    })
                              ],
                            ),
                          )
                        : SizedBox(
                            width: 130,
                            child: CustomButton(
                                title: 'Update',
                                onPressed: () {
                                  update_flag = true;
                                  setState(() {});
                                }))
                  ],
                ),
              );
  }
}
