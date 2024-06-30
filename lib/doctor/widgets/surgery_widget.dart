import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/common/models/surgery_model.dart';
import 'package:medicory_gp/doctor/services/surgeries_services.dart';
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
  bool loading = false;
  bool flag = true;
  bool update_flag = false;
  String? newName;
  String? newDescription;

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
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
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
                        SurgeriesServices()
                            .deleteSurgery(id: myInfo.id)
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
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
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
                        SurgeriesServices()
                            .deleteSurgery(id: myInfo.id)
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
                                    onPressed: () async {
                                      loading = true;
                                      setState(() {});
                                      SurgeriesServices()
                                          .update(
                                              userCode: BlocProvider.of<
                                                      GetPatientCubit>(context)
                                                  .patientInfoModel
                                                  .code,
                                              id: myInfo.id,
                                              name: newName ?? myInfo.name,
                                              description: newDescription ??
                                                  myInfo.description)
                                          .then((value) {
                                        SurgeriesServices()
                                            .getSurgery(id: myInfo.id)
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
