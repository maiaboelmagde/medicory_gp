import 'package:flutter/material.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static final String id = 'SettingsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      bottomNavigationBar: OwnerbottomNavigationBar(),);
  }
}