import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/owner/services/medical_history_services.dart';
import 'package:medicory_gp/owner/widgets/disease_widget.dart';

class AllergiesHistoryPage extends StatelessWidget {
  const AllergiesHistoryPage({super.key, required this.userCode});
  final String userCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text('Allergical History : ' ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        
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
      body: FutureBuilder(
          future: MedicalHistoryServices().getAllergies(userCode: userCode),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (context, indx) {
                return DiseaseWidget(diseaseInfo: snap.data![indx]);
              });
            }else{
              if(snap.hasError){
                showSnackBar(context, snap.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
