import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/common/models/prescription_model.dart';

class MedicationScheduleWidget extends StatefulWidget {
  const MedicationScheduleWidget({super.key, required this.medicine});
  final medication medicine;

  @override
  State<MedicationScheduleWidget> createState() => _MedicationScheduleWidgetState();
}

class _MedicationScheduleWidgetState extends State<MedicationScheduleWidget> {
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
                    Text(widget.medicine.medicineName),
                    GestureDetector(
                      child: Icon(Icons.arrow_drop_down),
                      onTap: () {
                        showDetails = false;
                        setState(() {});
                      },
                    )
                  ],
                ),
                Text( 'Dose : ' + widget.medicine.dose),
                Text('Frequency : ' + widget.medicine.frequency.toString()),
                Text('Tips : ' + widget.medicine.tips)
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
                Text(widget.medicine.medicineName),
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