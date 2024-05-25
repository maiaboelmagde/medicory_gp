import 'package:flutter/material.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class AddDiseasePage extends StatelessWidget {
  static const String id = "AddDiseasePage";
  const AddDiseasePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a disease :"),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Disease name : '),
            CustomTextField(title: 'Disease name', onChange: (value){},),
            Text('Date of diagnosis : '),
            CustomTextField(title: 'Date of diagnosis ',onChange: (value){},),
            Text('Current status or severity level : ',),
            CustomTextField(title: 'Current status',onChange: (value){},),
            Text('Treatment plan : '),
            CustomTextField(title: 'Treatment plan ',onChange: (value){},),
            Text('Additional notes : '),
            CustomTextField(title: ' Additional notes ',onChange: (value){},),
            Spacer(),
            CustomButton(
              title: ' ADD ',
              onPressed: () {},
            ),
          ],
          // children: [

          //   Text('Disease name : '),
          //   Spacer(flex: 1),
          //   Text('Date of diagnosis : '),
          //   Spacer(flex: 1),
          //   Text('Current status or severity level : '),
          //   Spacer(flex: 1),
          //   Text('Treatment plan : '),
          //   Spacer(flex: 1),
          //   Text('Additional notes : '),
          //   Spacer(flex: 1)
          // ],
        ),
      ),
    );
  }
}
