import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medicory_gp/Pages/login_page.dart';
import 'package:medicory_gp/widgets/login_upper_part.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
