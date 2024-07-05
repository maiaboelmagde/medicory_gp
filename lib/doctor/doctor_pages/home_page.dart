import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/patient_loading_states.dart';
import 'package:medicory_gp/doctor/doctor_pages/no_patient_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/patient_loaded_page.dart';
import 'package:medicory_gp/doctor/doctor_pages/search_for_patient_page.dart';

class DocHomePage extends StatelessWidget {
  const DocHomePage({super.key});
  static const String id = "DocHomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page' ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
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
          ),SizedBox(width: 50,),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const SearchForPatientPage();
                  }),
                );
              },
              icon: const Icon(Icons.search,color: Colors.white,))
        ],
      ),
      body: BlocBuilder<GetPatientCubit, PatientLoadingStates>(
        builder: (context, state) {
          if(state is PatientInitialState){
            return NoPatientPage();
          }else if (state is PatientLoadedState){
            return PatientLoadedPage();
          }else{
            return Text("Oops! there's an error");
          }
        },
      ),
    );
  }
}