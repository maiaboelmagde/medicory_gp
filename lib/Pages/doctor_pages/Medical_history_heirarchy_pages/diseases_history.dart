import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicory_gp/Pages/doctor_pages/Medical_history_heirarchy_pages/disease_details_page.dart';
import 'package:medicory_gp/widgets/custom_button.dart';

class DiseaseHistoryPage extends StatelessWidget {
  static final String id = "DiseaseHistoryPage";
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
      'Disease 12'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Diseases :"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 620,
            child: ListView.builder(
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
                }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
                height: 80,
                width: 160,
                child: CustomButton(title: 'ADD', onPressed: () {})),
          )
        ],
      ),
    );
  }
}
