import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/disease_pages_hierarchy/add_disease_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/Medical_history_heirarchy_pages/disease_pages_hierarchy/disease_details_page.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';

class DiseaseHistoryPage extends StatelessWidget {
  static const String id = "DiseaseHistoryPage";
  const DiseaseHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> diseases = [
      'Disease 1',
      'Disease 2',
      'Disease 3',
      'Disease 4',
      'Disease 5',
      'Disease 6',
      'Disease 7',
      'Disease 8',
      'Disease 9',
      'Disease 10',
      'Disease 11',
      'Disease 12',
      'Disease 8',
      'Disease 9',
      'Disease 10',
      'Disease 11',
      'Disease 12'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Diseases :"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          return ListView.builder(
                    itemCount: diseases.length,
                    itemBuilder: (context, idx) {
                      return CustomButton(
                          title: diseases[idx],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DiseaseDetailsPage(title: diseases[idx]);
                            }));
                          });
                    });
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kColor,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddDiseasePage();
          }));
        },
      ),
    );
  }
}
