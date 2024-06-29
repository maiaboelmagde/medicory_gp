import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medicory_gp/common/widgets/loginas_dropdown_button.dart';

class LoginUpperPart extends StatelessWidget {
  const LoginUpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInUp(
                duration: const Duration(milliseconds: 1000),
                child: Center(
                  child: const Text(
                    "Medicory",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                )),
            const SizedBox(
              height: 70,
            ),
            
          ],
        ));
  }
}
