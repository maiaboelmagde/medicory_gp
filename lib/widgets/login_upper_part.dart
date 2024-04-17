import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:medicory_gp/widgets/loginas_dropdown_button.dart';

class LoginUpperPart extends StatelessWidget {
  const LoginUpperPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInUp(
                duration: Duration(milliseconds: 1000),
                child: Text(
                  "Medicory",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )),
            SizedBox(
              height: 10,
            ),
            FadeInUp(
                duration: Duration(milliseconds: 1300),
                child: Row(
                  children: [
                    Text(
                      "login as ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    LogasDropDownButton(),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                )),
          ],
        ));
  }
}
