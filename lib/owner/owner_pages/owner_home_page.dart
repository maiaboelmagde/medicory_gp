import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/doctor_pages/lab_pages_hierarchy/imaging_results.dart';

import 'package:medicory_gp/owner/models/owner_model.dart';
import 'package:medicory_gp/owner/owner_pages/Imaging_tests_page.dart';
import 'package:medicory_gp/owner/owner_pages/allergies_history_page.dart';
import 'package:medicory_gp/owner/owner_pages/choronic_disease_page.dart';
import 'package:medicory_gp/owner/owner_pages/immunizations_page.dart';
import 'package:medicory_gp/owner/owner_pages/lab_tests_results_page.dart';

import 'package:medicory_gp/owner/owner_pages/prescriptions_page.dart';
import 'package:medicory_gp/owner/owner_pages/surgrical_history_page.dart';
import 'package:medicory_gp/owner/widgets/medical_history_widget.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class OwnerHomePage extends StatelessWidget {
  static const String id = 'OwnerHomePage';
  const OwnerHomePage({super.key, required this.ownerCode});
  final OwnerModel ownerCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Owner Home Page',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kColor,
        actions: [
          
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(360), image: DecorationImage(
                                  image: AssetImage('images/logo.png'),
                                  fit: BoxFit.fill),),
          ),SizedBox(width: 50,)
        ],
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
              SizedBox(height: 10),
              Text(
                'Welcome, ' + ownerCode.firstName + ' ' + ownerCode.lastName,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "Here's your medical history : ",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        MedicalHistoryWidget(
                          imageName: 'images/prescription_icon.png',
                          title: 'Prescriptions',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PrescriptionsPage(
                                usercode: ownerCode.code,
                              );
                            }));
                          },
                        ),
                        MedicalHistoryWidget(
                          imageName: 'images/surgery_icon.png',
                          title: 'Surgrical History',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SurgricalHistoryPage(
                                UserCode: ownerCode.code,
                              );
                            }));
                          },
                        ),
                        MedicalHistoryWidget(
                            title: 'Choronic Diseases',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ChoronicDiseasePage(
                                  userCode: ownerCode.code,
                                );
                              }));
                            },
                            imageName: 'images/choronic_disease_image.png'),
                        MedicalHistoryWidget(
                          imageName: 'images/allergies_icon.png',
                          title: 'Allergies',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AllergiesHistoryPage(
                                userCode: ownerCode.code,
                              );
                            }));
                          },
                        ),
                        MedicalHistoryWidget(
                            title: 'Immunizations',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ImmunizationsPage(
                                  userCode: ownerCode.code,
                                );
                              }));
                            },
                            imageName: 'images/immunizations_icon.png'),
                        MedicalHistoryWidget(
                            title: 'Lab Tests Results',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LabTestsResultsPage(
                                  userCode: ownerCode.code,
                                );
                              }));
                            },
                            imageName: 'images/labTests.png'),
                        MedicalHistoryWidget(
                            title: 'Imaging Results',
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ImagingTestsPage(
                                  userCode: ownerCode.code,
                                );
                              }));
                            },
                            imageName: 'images/imagingTests.png'),
                      ],
                    ),
                  ),

                  // child: Row(
                  //   children: [
                  //     Column(
                  //       children: [
                  //         Spacer(flex: 2),

                  //        MedicalHistoryWidget(imageName: 'images/surgery_icon.png', title: 'Surgrical History',onPressed: (){}, ),
                  //         Spacer(flex: 1),

                  //        MedicalHistoryWidget(title: 'Choronic Diseases', onPressed: (){}, imageName: 'images/choronic_disease_image.png'),
                  //         Spacer(flex: 2),
                  //       ],
                  //     ),
                  //      Column(
                  //       children: [
                  //         Spacer(flex: 2),

                  //        MedicalHistoryWidget(imageName: 'images/surgery_icon.png', title: 'Surgrical History',onPressed: (){}, ),
                  //         Spacer(flex: 1),

                  //        MedicalHistoryWidget(title: 'Choronic Diseases', onPressed: (){}, imageName: 'images/choronic_disease_image.png'),
                  //         Spacer(flex: 2),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OwnerbottomNavigationBar(
        ownerCode: ownerCode,
      ),
    );
  }
}
