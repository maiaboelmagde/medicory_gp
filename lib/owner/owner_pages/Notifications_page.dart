import 'package:flutter/material.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  static final String id = 'NotificationsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications : '),
      ),

      bottomNavigationBar: OwnerbottomNavigationBar(),
    );
  }
}
