import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/models/disease_model.dart';

class DiseaseWidget extends StatefulWidget {
  const DiseaseWidget({super.key, required this.diseaseInfo});
  final DiseaseModel diseaseInfo;

  @override
  State<DiseaseWidget> createState() => _DiseaseWidgetState();
}

class _DiseaseWidgetState extends State<DiseaseWidget> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return (flag == true)
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
                border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8),color: Colors.white,),
                
            child: Column(
              children: [
                Row(
                  children: [
                    Text(widget.diseaseInfo.name),
                    GestureDetector(
                      child: Icon(Icons.arrow_drop_down),
                      onTap: () {
                        flag = false;
                        setState(() {});
                      },
                    )
                  ],
                ),
                Text( 'Description : ' + widget.diseaseInfo.information),
                Text('Created at : ' + widget.diseaseInfo.createdAt),
                Text('Updated at : ' + widget.diseaseInfo.updatedAt)
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
                border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,),
            child: Row(
              children: [
                Text(widget.diseaseInfo.name),
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
