import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';
import 'package:medicory_gp/owner/owner_pages/owner_search_page.dart';
import 'package:medicory_gp/owner/owner_pages/medical_schedule_page.dart';
import 'package:medicory_gp/owner/owner_pages/owner_home_page.dart';
import 'package:medicory_gp/owner/owner_pages/personal_info_page.dart';
import 'package:medicory_gp/owner/owner_pages/settings_page.dart';

class OwnerbottomNavigationBar extends StatelessWidget {
  const OwnerbottomNavigationBar({super.key, required this.ownerCode});
  final OwnerModel ownerCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Spacer(
            flex: 1,
          ),
          GestureDetector(
            child: Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.home),
                  Text('Home')
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OwnerHomePage(ownerCode: ownerCode);
              }));
            },
          ),
          Spacer(
            flex: 2,
          ),
          GestureDetector(
            child: Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.saved_search),
                  Text('Search')
                ],
              ),
            ),

            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OwnerSearchPage(
                  ownerCode: ownerCode,
                );
              }));
            },
          ),
          Spacer(
            flex: 2,
          ),
          GestureDetector(
            child: Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.person),
                  Text('myInfo')
                ],
              ),
            ),
              
            
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PersonalInfoPage(
                  ownerCode: ownerCode,
                );
              }));
            },
          ),
          Spacer(
            flex: 2,
          ),
          GestureDetector(
            child: Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.table_chart_outlined),
                  Text('Schedule')
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MedicalSchedulePage(ownerCode: ownerCode);
              }));
            },
          ),
          Spacer(
            flex: 2,
          ),
          GestureDetector(
            child: Container(
              height: 50,
              child: Column(
                children: [
                  Icon(Icons.settings),
                  Text('Settings')
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingsPage(ownerCode: ownerCode);
              }));
            },
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
