import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddPrescriptionPage extends StatelessWidget {
  static final String id = "AddPrescriptionPage";
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
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'ADD',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
