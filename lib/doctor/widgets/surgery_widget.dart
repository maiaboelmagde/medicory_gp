import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/models/surgery_model.dart';

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
   bool flag = false;

  @override
  Widget build(BuildContext context) {
   

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
                Text('Created at ' + myInfo.createdAt),
                Text('Updated at ' + myInfo.updatedAt),
                Text("Description" + myInfo.description)
              ],
            ),
          );
  }
}
