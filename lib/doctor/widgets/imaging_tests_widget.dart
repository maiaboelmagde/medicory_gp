import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/models/images_model.dart';

class ImagingTestsWidget extends StatefulWidget {
  const ImagingTestsWidget({super.key, required this.myImagingInfo});
  final ImagesModel myImagingInfo;

  @override
  State<ImagingTestsWidget> createState() =>
      _ImagingTestsWidgetState(myImagingInfo: myImagingInfo);
}

class _ImagingTestsWidgetState extends State<ImagingTestsWidget> {
  _ImagingTestsWidgetState({required this.myImagingInfo});
  final ImagesModel myImagingInfo;
  bool showDetails = false;
  @override
  @override
  Widget build(BuildContext context) {
    return showDetails
        ? Container(
           padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.8),
            border: Border.all(style: BorderStyle.solid)),
          child: Column(children: [
              Row(
              children: [
                Text(myImagingInfo.name),
                GestureDetector(
                  child: Icon(Icons.arrow_drop_down),
                  onTap: () {
                    showDetails = false;
                    setState(() {});
                  },
                )
              ],
            ),
              Text(myImagingInfo.description),
              Text(myImagingInfo.imageResult ?? 'Not assigned yet'),
              Text(myImagingInfo.resultNotes ?? 'Not assigned yet'),
              Text(myImagingInfo.updatedAt ?? 'Not updated'),
            ]),
        )
        : Container(
           padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.8),
            border: Border.all(style: BorderStyle.solid)),
          child: Row(
              children: [
                Text(myImagingInfo.name),
                GestureDetector(
                  child: Icon(Icons.arrow_drop_up),
                  onTap: () {
                    showDetails = true;
                    setState(() {});
                  },
                )
              ],
            ),
        );
  }
}
