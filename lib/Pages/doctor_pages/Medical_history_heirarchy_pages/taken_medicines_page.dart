import 'package:flutter/material.dart';
import 'package:medicory_gp/widgets/search_textfield.dart';

class TakenMedicinesPage extends StatelessWidget {
  static const String id = "MedicinesHistoryPage";
  const TakenMedicinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Taken Medicines :"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchTextField(onchange: (data) {}),
          )
        ],
      ),
    );
  }
}
