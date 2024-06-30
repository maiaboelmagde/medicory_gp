import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';

class MedicalHistoryWidget extends StatelessWidget {
  final String title;
  final String imageName;
  final Function() onPressed;
  const MedicalHistoryWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FadeInUp(
          duration: Duration(milliseconds: 1600),
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 100,
              // margin: EdgeInsets.symmetric(horizontal: 50),
              // color: Colors.orange[900],

              decoration: BoxDecoration(
                color: kColor,
                borderRadius: BorderRadius.circular(50),
              ),
              // decoration: BoxDecoration(
              // ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imageName),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(80)),
                        )),
                  ),
                  
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )),
    );
  }
}
