import 'package:flutter/material.dart';
import 'package:medicory_gp/common/helpers/show_snack_bar.dart';
import 'package:medicory_gp/common/services/login_service.dart';
import 'package:medicory_gp/doctor/widgets/custom_button.dart';
import 'package:medicory_gp/doctor/widgets/custom_text_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool verifyPassword = false;
  bool verified = false;
  String? email;
  String? passWord;
  String? confirmPassWord;
  String? verifyCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: (verifyPassword)
            ? Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email :'),
                      SizedBox(height: 10),
                      TextField(
                          decoration: InputDecoration(
                              hintText: email!,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          readOnly: true,
                          onChanged: (value) {
                            email = value;
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      (verified)
                          ? Column(
                              children: [
                                Text('Enter the password : '),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    decoration: InputDecoration(
                                        hintText: 'password',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16))),
                                    onChanged: (value) {
                                      passWord = value;
                                    }),
                                SizedBox(
                                  height: 30,
                                ),
                                Text('Enter the password again : '),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    decoration: InputDecoration(
                                        hintText: 'confirm password',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16))),
                                    onChanged: (value) {
                                      confirmPassWord = value;
                                    }),
                                 CustomButton(
                                    title: 'verify',
                                    onPressed: () {
                                      if (passWord != null ||
                                          passWord!.length < 12) {
                                            if(confirmPassWord != null && confirmPassWord == passWord)
                                       { LoginServices()
                                            .ResetPassword(
                                                email: email!,
                                                passWord: passWord!)
                                            .then((onValue) {
                                          if (onValue == null) {
                                            showSnackBar(
                                                context, 'Some thing went wrong');
                                          } else {
                                            showSnackBar(context, onValue);
                                            Navigator.pop(context);
                                          }
                                        });}else{
                                          showSnackBar(context, 'you should enter the same passwords');
                                        }
                                      } else {
                                        showSnackBar(
                                            context, 'Please Enter a valid password ,its length more than 12');
                                      }
                                    })
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Enter verify code : '),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    decoration: InputDecoration(
                                        hintText: 'code',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16))),
                                    onChanged: (value) {
                                      verifyCode = value;
                                    }),
                               
                                    CustomButton(
                                    title: 'verify',
                                    onPressed: () {
                                      if (verifyCode != null ) {
                                        LoginServices()
                                            .verifingCode(
                                                email: email!,
                                                verifyCode: verifyCode!)
                                            .then((onValue) {
                                          if (onValue == null) {
                                            showSnackBar(
                                                context, 'Invalid code');
                                          } else {
                                            showSnackBar(context, onValue);
                                            verified = true;
                                            setState(() {});
                                          }
                                        });
                                      } else {
                                        showSnackBar(
                                            context, 'Please Enter the code that sent to your email');
                                      }
                                    })
                              ],
                            ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              )
            : Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Enter your email :'),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          onChanged: (value) {
                            email = value;
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          title: 'Search',
                          onPressed: () {
                            if (email != null || email!.isNotEmpty) {
                              LoginServices()
                                  .forgotPassword(email: email!)
                                  .then((onValue) {
                                if (onValue == null) {
                                  showSnackBar(context, 'Invalid email');
                                } else {
                                  showSnackBar(context, onValue);
                                  verifyPassword = true;
                                  setState(() {});
                                }
                              });
                            } else {
                              showSnackBar(context, 'Please Enter your email');
                            }
                          })
                    ],
                  ),
                ),
              ));
  }
}
