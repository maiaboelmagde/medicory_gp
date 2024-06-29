import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/medical_history_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/tests_results_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_info_page.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/search_textfield.dart';
import 'package:medicory_gp/owner/owner_pages/Notifications_page.dart';
import 'package:medicory_gp/owner/owner_pages/medical_schedule_page.dart';
import 'package:medicory_gp/owner/owner_pages/personal_info_page.dart';
import 'package:medicory_gp/owner/owner_pages/settings_page.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class OwnerHomePage extends StatelessWidget {
  static const String id = 'OwnerHomePage';
  const OwnerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Home Page'),
        centerTitle: true,
        backgroundColor: kColor,
      ),
      body: Container(
         
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                        kColorsGroup.shade900,

          kColorsGroup.shade800,
          kColorsGroup.shade700,
          kColorsGroup.shade300
        ])),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),          
              Text('Welcome, name', style: TextStyle(color: Colors.white, fontSize: 30),),
              Expanded(
                child: Container(
                   decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(60),
                            )),
                
                    
                    child: Column(
                      
                      children: [
                        Spacer(flex: 2),
                        SearchTextField(onchange: (data) {}),
                        Spacer(flex: 1),
                        CustomButton(title: 'Current Medical Schedule', onPressed: () {}),
                        Spacer(flex: 1),
                        CustomButton(
                            title: 'Medical history',
                            onPressed: () {
                              Navigator.pushNamed(context, MedicalHistoryPage.id);
                            }),
                        Spacer(flex: 1),
                        CustomButton(
                            title: 'Tests Results',
                            onPressed: () {
                              Navigator.pushNamed(context, TestsResultsPage.id);
                            }),
                        Spacer(flex: 1),
                        CustomButton(
                            title: 'Personal Information',
                            onPressed: () {
                              Navigator.pushNamed(context, PatientInfoPage.id);
                            }),
                        Spacer(flex: 2),
                      ],
                    ),
                  ),
              ),
            ],
          ),
          ),
        ),
    
      bottomNavigationBar: OwnerbottomNavigationBar(),
    );
  }
}

