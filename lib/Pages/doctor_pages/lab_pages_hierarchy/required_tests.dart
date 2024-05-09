import 'package:flutter/material.dart';

class RequiredTestsPage extends StatelessWidget {
  static const String id = 'RequiredTestsPage';
  const RequiredTestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Required Tests : '),
      ),
    );
  }
}
