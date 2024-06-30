import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/common/models/surgery_model.dart';

class SurgeryWidget extends StatefulWidget {
  const SurgeryWidget({super.key, required this.surgery});
  final SurgeryModel surgery;

  @override
  State<SurgeryWidget> createState() => _SurgeryWidgetState();
}

class _SurgeryWidgetState extends State<SurgeryWidget> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return (flag == true)
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
                    Text(widget.surgery.name),
                    GestureDetector(
                      child: Icon(Icons.arrow_drop_down),
                      onTap: () {
                        flag = false;
                        setState(() {});
                      },
                    )
                  ],
                ),
                Text( 'Description : ' + widget.surgery.description),
                Text('Created at : ' + widget.surgery.createdAt),
                Text('Updated at : ' + widget.surgery.updatedAt)
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
                Text(widget.surgery.name),
                GestureDetector(
                  child: Icon(Icons.arrow_drop_up),
                  onTap: () {
                    flag = true;
                    setState(() {});
                  },
                )
              ],
            ),
          );
  }
}
