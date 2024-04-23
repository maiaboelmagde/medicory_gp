import 'package:flutter/material.dart';
import 'package:medicory_gp/widgets/custom_button.dart';
import 'package:medicory_gp/widgets/search_textfield.dart';

class AddPrescriptionPage extends StatelessWidget {
  static const String id = "AddPrescriptionPage";
  const AddPrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Prescription :"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SearchTextField(
              onchange: (data) {},
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              child: CustomButton(
                title: 'ADD',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
