import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medicory_gp/Pages/doctor_pages/doc_home_page.dart';
import 'package:medicory_gp/widgets/custom_button.dart';
import 'package:medicory_gp/widgets/login_upper_part.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'loginPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange.shade900,
          Colors.orange.shade800,
          Colors.orange.shade400
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            LoginUpperPart(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email or Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1500),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                          title: 'Log In',
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, DocHomePage.id);
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        // FadeInUp(
                        //     duration: Duration(milliseconds: 1700),
                        //     child: Text(
                        //       "Continue with social media",
                        //       style: TextStyle(color: Colors.grey),
                        //     )),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        // Row(
                        //   children: <Widget>[
                        //     Expanded(
                        //       child: FadeInUp(
                        //           duration: Duration(milliseconds: 1800),
                        //           child: MaterialButton(
                        //             onPressed: () {},
                        //             height: 50,
                        //             color: Colors.blue,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(50),
                        //             ),
                        //             child: Center(
                        //               child: Text(
                        //                 "Facebook",
                        //                 style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //             ),
                        //           )),
                        //     ),
                        //     SizedBox(
                        //       width: 30,
                        //     ),
                        //     Expanded(
                        //       child: FadeInUp(
                        //           duration: Duration(milliseconds: 1900),
                        //           child: MaterialButton(
                        //             onPressed: () {},
                        //             height: 50,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(50),
                        //             ),
                        //             color: Colors.black,
                        //             child: Center(
                        //               child: Text(
                        //                 "Github",
                        //                 style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //             ),
                        //           )),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
