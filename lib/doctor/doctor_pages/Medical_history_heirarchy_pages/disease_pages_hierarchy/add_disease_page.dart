import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/services/diseases_services.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class AddNewDisease extends StatelessWidget {
  const AddNewDisease({super.key, required this.topic});
  final String topic;

  @override
  Widget build(BuildContext context) {
    String? newName;
    String? newInformation;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Disease'),
      ),
      body: Column(
        children: [
          Text('Name'),
          CustomTextField(
              title: 'Name',
              onChange: (value) {
                newName = value;
              }),
          Text('Information'),
          CustomTextField(
              title: 'Information',
              onChange: (value) {
                newInformation = value;
              }),
          CustomButton(
              title: 'Add',
              onPressed: () {
                if (newName != null) {
                  if (newInformation != null) {
                    DiseasesServices(topic: topic)
                        .AddNewDisease(
                            code: BlocProvider.of<GetPatientCubit>(context)
                                .patientInfoModel
                                .code,
                            name: newName!,
                            information: newInformation!)
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(value + ' Reload the page to get it shown'),
                      ));
                    });
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('You must set a Description'),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('You must set a name'),
                  ));
                }
              }),
        ],
      ),
    );
  }
}
