import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/models/patient_info_model.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/services/get_patient_info_service.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';

class SearchForPatientPage extends StatelessWidget {
  const SearchForPatientPage({super.key});
  static const String id = 'SearchForPatientPage';

  @override
  Widget build(BuildContext context) {
    String code = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a Patient'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onChanged: (value){
                    code = value;
                  },
                  onSubmitted: (value) async {
                    var getPatientCubit = BlocProvider.of<GetPatientCubit>(context);
                    getPatientCubit.getPatient(patientCode: code);
                    Navigator.pop(context);
                    
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter patient code',
                    suffixIcon: Icon(Icons.search),
                    labelText: 'Search',
                  ),
                )),
                CustomButton(title: 'Search', onPressed: (){
                  var getPatientCubit = BlocProvider.of<GetPatientCubit>(context);
                    getPatientCubit.getPatient(patientCode: code);
                    Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}