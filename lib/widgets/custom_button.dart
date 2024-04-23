import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medicory_gp/Pages/doctor_pages/doc_home_page.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FadeInUp(
          duration: Duration(milliseconds: 1600),
          child: MaterialButton(
            onPressed: onPressed,
            height: 50,
            // margin: EdgeInsets.symmetric(horizontal: 50),
            color: Colors.orange[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            // decoration: BoxDecoration(
            // ),
            child: Center(
              child: Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}
