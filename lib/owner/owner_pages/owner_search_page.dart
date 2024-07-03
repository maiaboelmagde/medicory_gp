import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class OwnerSearchPage extends StatelessWidget {
  const OwnerSearchPage({super.key,required this.ownerCode});
   final OwnerModel ownerCode;
  static final String id = 'NotificationsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text('Notifications : '),
      ),

      bottomNavigationBar: OwnerbottomNavigationBar(ownerCode: ownerCode,),
    );
  }
}
