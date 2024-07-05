import 'package:flutter/material.dart';
import 'package:medicory_gp/common/Pages/login_page.dart';
import 'package:medicory_gp/common/constants.dart';
import 'package:medicory_gp/owner/models/owner_model.dart';
import 'package:medicory_gp/owner/widgets/owner_bottom_navigation_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key, required this.ownerCode});
  final OwnerModel ownerCode;
  static final String id = 'SettingsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text('Settings'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          kColorsGroup.shade500,
          kColorsGroup.shade700,
          kColorsGroup.shade900
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person_outlined),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      ownerCode.firstName +
                          ' ' +
                          ownerCode.middleName +
                          ' ' +
                          ownerCode.lastName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   ownerCode.loginInfo.email,
                    //   style:
                    //       TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    // )
                  ],
                ),
                Spacer(
                  flex: 2,
                )
              ]),
              SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(60),
                              )),
                          child: Row(
                            children: [Spacer(), Icon(Icons.report),Spacer(), Text('Report a bug',style: TextStyle(fontSize: 20),),Spacer(flex: 2,),Icon(Icons.arrow_right_outlined)],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.all(
                                Radius.circular(60),
                              )),
                          child: Row(
                            children: [Spacer(), Icon(Icons.send),Spacer(), Text('Send a feedback',style: TextStyle(fontSize: 20),),Spacer(flex: 2,),Icon(Icons.arrow_right_outlined)],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, LoginPage.id);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(60),
                                )),
                            child: Row(
                              children: [Spacer(), Icon(Icons.logout),Spacer(), Text('Log Out',style: TextStyle(fontSize: 20),),Spacer(flex: 2,)],
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
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
