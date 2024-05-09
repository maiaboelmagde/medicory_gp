import 'package:flutter/material.dart';

class SurgicalHistoryPage extends StatelessWidget {
  static const String id = "SurgicalHistoryPage";
  const SurgicalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surgical History :"),
      ),
    );
  }
}
