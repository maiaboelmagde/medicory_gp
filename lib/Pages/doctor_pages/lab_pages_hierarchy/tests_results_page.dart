import 'package:flutter/material.dart';

class TestsResultsPage extends StatelessWidget {
  static const String id = 'TestsResultsPage';
  const TestsResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tests Results : '),
      ),
    );
  }
}
