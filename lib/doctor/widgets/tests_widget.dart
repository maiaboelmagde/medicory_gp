import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/models/tests_model.dart';
import 'package:medicory_gp/doctor/services/tests_services.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class TestsWidget extends StatefulWidget {
  const TestsWidget({super.key, required this.testInfo});
  final TestsModel testInfo;

  @override
  State<TestsWidget> createState() => _SurgeryWidgetState(myInfo: testInfo);
}

class _SurgeryWidgetState extends State<TestsWidget> {
  _SurgeryWidgetState({required this.myInfo});
  TestsModel myInfo;
  bool loading = false;
  bool flag = true;
  bool update_flag = false;
  String? newName;
  String? newDescription;
  String? newResultNotes;

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
                        TestsServices()
                            .deleteTest(context, id: myInfo.id)
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text(value + ' , please ,Update the page')));
                          setState(() {});
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
                            TestsServices()
                                .deleteTest(context,id: myInfo.id)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(value +
                                          ' , please ,Update the page')));
                              setState(() {});
                            });
                          },
                        )
                      ],
                    ),
                    Text("Description : " + myInfo.description),
                    Text('Test Notes : ' +
                        (myInfo.testNotes ?? 'Not assigned yet')),
                    Text('Test Result : ' +
                        (myInfo.testResult ?? 'Not assigned yet')),
                    Text('Updated at : ' +
                        (myInfo.updatedAt ?? 'Didn\'t update')),
                    (update_flag)
                        ? SizedBox(
                            height: 420,
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
                                Text('New Notes : '),
                                CustomTextField(
                                  title: 'Notes',
                                  onChange: (value) {
                                    newResultNotes = value;
                                  },
                                ),
                                CustomButton(
                                    title: 'Update',
                                    onPressed: () async {
                                      loading = true;
                                      setState(() {});
                                      TestsServices()
                                          .update(
                                              userCode: BlocProvider.of<
                                                      GetPatientCubit>(context)
                                                  .patientInfoModel
                                                  .code,
                                              id: myInfo.id,
                                              name: newName ?? myInfo.name,
                                              description: newDescription ??
                                                  myInfo.description,
                                              testResult:
                                                  myInfo.testResult ?? '',
                                              resultNotes: newResultNotes ??
                                                  myInfo.testNotes ??
                                                  '',
                                              status: true)
                                          .then((value) {
                                        TestsServices()
                                            .getTest(id: myInfo.id)
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
