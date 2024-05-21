import 'package:flutter/material.dart';

class ImagingResultsPage extends StatelessWidget {
  static const String id = 'ImagingResultsPage';
  const ImagingResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imaging Results : '),
      ),
    );
  }
}
