import 'package:flutter/material.dart';
import 'package:medicory_gp/widgets/custom_button.dart';

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
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search by name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  suffixIcon: Icon(Icons.search)),
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
