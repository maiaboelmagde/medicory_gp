import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/owner/owner_pages/Notifications_page.dart';
import 'package:medicory_gp/owner/owner_pages/medical_schedule_page.dart';
import 'package:medicory_gp/owner/owner_pages/owner_home_page.dart';
import 'package:medicory_gp/owner/owner_pages/personal_info_page.dart';
import 'package:medicory_gp/owner/owner_pages/settings_page.dart';

class OwnerbottomNavigationBar extends StatelessWidget {
  const OwnerbottomNavigationBar({
    super.key,
  });

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        
        children: [
          Spacer(flex: 1,),
          GestureDetector(child: Icon(Icons.home),onTap: (){ 
            Navigator.pop(context);
            Navigator.pushNamed(context, OwnerHomePage.id);
          },),
          Spacer(flex: 2,),
          GestureDetector(child: Icon(Icons.notifications_active),onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, NotificationsPage.id);
          },),
          Spacer(flex: 2,),
          GestureDetector(child: CircleAvatar(child: Icon(Icons.person),foregroundColor: kColor,),onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, PersonalInfoPage.id);
          },),
          Spacer(flex: 2,),
          
          GestureDetector(child: Icon(Icons.table_chart_outlined),onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, MedicalSchedulePage.id);
          },),
          Spacer(flex: 2,),
          GestureDetector(child: Icon(Icons.settings),onTap: (){
            Navigator.pop(context);
            Navigator.pushNamed(context, SettingsPage.id);
          },),
          Spacer(flex: 1,)
        ],
      ),
    );
  }
}
