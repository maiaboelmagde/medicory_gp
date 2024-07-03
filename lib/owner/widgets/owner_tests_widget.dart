import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/models/tests_model.dart';

class OwnerTestsWidget extends StatefulWidget {
  const OwnerTestsWidget({super.key, required this.testInfo});
  final TestsModel testInfo;

  @override
  State<OwnerTestsWidget> createState() => _OwnerTestsWidgetState();
}

class _OwnerTestsWidgetState extends State<OwnerTestsWidget> {
bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return (showDetails == true)
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
                border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.testInfo.name),
                    GestureDetector(
                      child: Icon(Icons.arrow_drop_down),
                      onTap: () {
                        showDetails = false;
                        setState(() {});
                      },
                    )
                  ],
                ),
                Text( 'Description : ' + widget.testInfo.description),
                Text('test Notes : ' + (widget.testInfo.testNotes ?? 'No Notes')),
                Text('testResults : '+(widget.testInfo.testResult??'not assigned yet')),
                Text('createdAt : ' + (widget.testInfo.createdAt ?? '---------'),),
                                Text('updatedAt : ' + (widget.testInfo.updatedAt ?? " -------- "),


                )
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
                border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Text(widget.testInfo.name),
                GestureDetector(
                  child: Icon(Icons.arrow_drop_up),
                  onTap: () {
                    showDetails = true;
                    setState(() {});
                  },
                )
              ],
            ),
          );;
  }
}