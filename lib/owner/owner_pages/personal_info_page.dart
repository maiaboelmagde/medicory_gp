import 'package:flutter/material.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key,required this.ownerCode});
   final OwnerModel ownerCode;
  static final String id ='PersonalInfoPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Personal Info'),),
    bottomNavigationBar: OwnerbottomNavigationBar(ownerCode: ownerCode,),
    );
  }
}