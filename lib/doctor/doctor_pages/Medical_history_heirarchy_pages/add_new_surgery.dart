import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/doctor/cubits/get_patient_cubit/get_patient_cubit.dart';
import 'package:medicory_gp/doctor/services/surgeries_services.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class AddNewSurgery extends StatelessWidget {
  const AddNewSurgery({super.key});

  @override
  Widget build(BuildContext context) {
    String? newName;
    String? newDescription;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Surgery',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
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
          
        ]
      ),
      body: Column(
        children: [
          Text('Name'),
          CustomTextField(
              title: 'Name',
              onChange: (value) {
                newName = value;
              }),
          Text('Description'),
          CustomTextField(
              title: 'Description',
              onChange: (value) {
                newDescription = value;
              }),
          CustomButton(
              title: 'Add',
              onPressed: () {
                if (newName != null) {
                  if (newDescription != null) {
                    SurgeriesServices()
                        .AddNewSurgery(
                            code: BlocProvider.of<GetPatientCubit>(context)
                                .patientInfoModel
                                .code,
                            name: newName!,
                            description: newDescription!)
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(value + ' Reload the page to get it shown'),
                      ));
                    });
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('You must set a Description'),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('You must set a name'),
                  ));
                }
              }),
        ],
      ),
    );
  }
}
