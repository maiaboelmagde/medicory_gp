import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medicory_gp/common/widgets/loginas_dropdown_button.dart';

class LoginUpperPart extends StatelessWidget {
  const LoginUpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Center(
                  child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/logo.png'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(80)),
                        )),
                )),
            FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Center(
                  child: const Text(
                    "Medicory",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            
          ],
        );
  }
}
