import 'package:flutter/material.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class MedicalSchedulePage extends StatelessWidget {
  const MedicalSchedulePage({super.key ,required this.ownerCode});
   final OwnerModel ownerCode;
  static final String id = 'MedicalSchedulePage';
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Schedule page'),
      ),

      bottomNavigationBar: OwnerbottomNavigationBar(ownerCode: ownerCode ,),
    );
  }
}
