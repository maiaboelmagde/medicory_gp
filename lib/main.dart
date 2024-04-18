import 'package:flutter/material.dart';
import 'package:medicory_gp/Pages/doctor_pages/doc_home_page.dart';
import 'package:medicory_gp/Pages/doctor_pages/medical_history_page.dart';
import 'package:medicory_gp/Pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage().id: (context) => LoginPage(),
        const DocHomePage().id: (context) => const DocHomePage(),
        MedicalHistoryPage().id: (context) => const MedicalHistoryPage()
      },
      initialRoute: LoginPage().id,
    );
  }
}
