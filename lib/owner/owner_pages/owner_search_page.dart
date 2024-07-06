import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class OwnerSearchPage extends StatefulWidget {
  const OwnerSearchPage({super.key,required this.ownerCode});
   final OwnerModel ownerCode;
  static final String id = 'NotificationsPage';

  @override
  State<OwnerSearchPage> createState() => _OwnerSearchPageState();
}

class _OwnerSearchPageState extends State<OwnerSearchPage> {
  num searchNum = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text('Search for : '),
        
      ),

      bottomNavigationBar: OwnerbottomNavigationBar(ownerCode: widget.ownerCode,),
    );
  }
}
