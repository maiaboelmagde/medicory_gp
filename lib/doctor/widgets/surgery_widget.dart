import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/models/surgery_model.dart';
import 'package:medicory_gp/doctor/services/update_surgery_service.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class SurgeryWidget extends StatefulWidget {
  const SurgeryWidget({super.key, required this.surgeryInfo});
  final SurgeryModel surgeryInfo;

  @override
  State<SurgeryWidget> createState() =>
      _SurgeryWidgetState(myInfo: surgeryInfo);
}

class _SurgeryWidgetState extends State<SurgeryWidget> {
  _SurgeryWidgetState({required this.myInfo});
  SurgeryModel myInfo;
  bool flag = true;
  bool update_flag = false;

  @override
  Widget build(BuildContext context) {
    String? newName;
    String? newDescription;

    return (flag == true)
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
                    )
                  ],
                ),
                Text('Created at : ' + myInfo.createdAt),
                Text('Updated at : ' + myInfo.updatedAt),
                Text("Description : " + myInfo.description),
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
                                newDescription = value;
                              },
                            ),
                            CustomButton(
                                title: 'Update',
                                onPressed: () {
                                  UpdateSurgeryService().update(
                                      userCode:BlocProvider.of<GetPatientCubit>(context).patientInfoModel.code,
                                      id: myInfo.id,
                                      name: newName ?? myInfo.name,
                                      description: newDescription ?? myInfo.description);
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
