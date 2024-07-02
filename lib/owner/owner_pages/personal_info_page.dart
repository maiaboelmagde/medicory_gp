import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';
import 'package:medicory_gp/owner/services/get_personal_informations.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key, required this.ownerCode});
  final OwnerModel ownerCode;
  static final String id = 'PersonalInfoPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
      ),
      body: FutureBuilder(
        future: PersonalInformations().getInfoService(userCode: ownerCode.code),
        builder: (context, snap) {
          if (snap.hasData) {
            return SingleChildScrollView(
                child: Column(
              children: [
                Container(child: CircleAvatar(minRadius: 50,maxRadius: 100 ,child: Icon(Icons.person,),),),
                Container( margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Text('Name : '),
                     Spacer(),
                    Text(snap.data!.name.toString()),
                    Spacer()
                  ],
                ),
                ),
                Container( margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Text('Email : '),
                     Spacer(),
                    Text(snap.data!.email.toString()),
                    Spacer()
                  ],
                ),
                ),
                 Container( margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Text('Age : '),
                    Spacer(),
                    Text(snap.data!.age.toString()),
                    Spacer()
                  ],
                ),
                ),
                 Container( margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
                child:Row(
                  children: [
                    Text('Gender : '),
                     Spacer(),
                    Text(snap.data!.gender.toString()),
                    Spacer()
                  ],
                ),
                ),
                 Container( margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Text('Phone Number : '),
                     Spacer(),
                    Text(snap.data!.phoneNumbers.toString()),
                    Spacer()
                  ],
                ),
                ),
                 Container( margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Text('Relative Phone Numbers : '),
                     Spacer(),
                    Text(snap.data!.relativePhoneNumbers.toString()),
                    Spacer()
                  ],
                ),),
              
                 Container( margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Text('Address : '),
                     Spacer(),
                    Text(snap.data!.address.toString()),
                    Spacer()
                  ],
                ),
                ),
                Container( margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(border: Border.all(color: kColor),
                borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Text('Blood Type : '),
                     Spacer(),
                    Text(snap.data!.bloodType.toString()),
                    Spacer()
                  ],
                ),
                ),
                
              ],
            ));
          } else if (snap.hasError) {
            showSnackBar(context, snap.error.toString());
            return Center(
              child: Text('Something went wrong'),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: OwnerbottomNavigationBar(
        ownerCode: ownerCode,
      ),
    );
  }
}
