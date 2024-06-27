import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/services/images_services.dart';
import 'package:medicory_gp/doctor/services/tests_services.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class RequireImagingPage extends StatelessWidget {
  static const String id = 'RequireImagingPage';
  const RequireImagingPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? testName;
    String? testDescription;
    num? prescriptionId;
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding an Imaging Test : '),
      ),
      body: Column(
        children: [
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
          CustomTextField(
              title: 'prescription Id',
              onChange: (value) {
                try {
                  prescriptionId = num.parse(value);
                } on Exception catch (e) {
                  showSnackBar(
                      context, 'You must enter a valid prescription id');
                }
              }),
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
                  ImagesServices()
                      .AddNewImageTest(
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
