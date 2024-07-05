import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/services/tests_services.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class AddingTestsPage extends StatelessWidget {
  static const String id = 'RequiredTestsPage';
  const AddingTestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? testName;
    String? testDescription;
    num? prescriptionId;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Adding a Test : ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: kColor,
          actions: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(360),
                image: DecorationImage(
                    image: AssetImage('images/logo.png'), fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              width: 50,
            ),
          ]),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('adding new Test'),
           SizedBox(
            height: 30,
          ),
          CustomTextField(
              title: 'Test Name',
              onChange: (value) {
                testName = value;
              }),
               SizedBox(
            height: 30,
          ),
          CustomTextField(
              title: 'description',
              onChange: (value) {
                testDescription = value;
              }),
               SizedBox(
            height: 30,
          ),
          CustomTextField(
              title: 'prescription Id',
              onChange: (value) {
                prescriptionId = num.parse(value);
              }),
               SizedBox(
            height: 30,
          ),
          CustomButton(
              title: 'ADD',
              onPressed: () {
                if (testName == null) {
                  showSnackBar(context, 'You must write the Test name');
                } else if (testDescription == null) {
                  showSnackBar(context, 'You must write the Description');
                } else if (prescriptionId == null) {
                  showSnackBar(context, 'You must write the prescription Id');
                } else {
                  TestsServices()
                      .AddNewTest(
                          code: BlocProvider.of<GetPatientCubit>(context)
                              .patientInfoModel
                              .code,
                          prescriptionId: prescriptionId!,
                          name: testName!,
                          description: testDescription!)
                      .then((onValue) {
                    Navigator.pop(context);
                    showSnackBar(
                        context, 'Added sucessfully , Please refresh the page');
                  });
                }
              })
        ],
      ),
    );
  }
}
