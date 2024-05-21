import 'package:flutter/material.dart';
import 'package:medicory_gp/common/constants.dart';

class LogasDropDownButton extends StatefulWidget {
  const LogasDropDownButton({
    super.key,
  });

  @override
  State<LogasDropDownButton> createState() => _LogasDropDownButtonState();
}

class _LogasDropDownButtonState extends State<LogasDropDownButton> {
  String dropdownValue = loginAsList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: dropdownValue,
        items: loginAsList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        //  [
        // DropdownMenuItem<String>(
        //   value: loginAsList[0],
        //   child: Text(loginAsList[0]),
        // ),
        // DropdownMenuItem<String>(
        //   value: loginAsList[1],
        //   child: Text(loginAsList[1]),
        // ),
        // DropdownMenuItem<String>(
        //   value: loginAsList[2],
        //   child: Text(loginAsList[2]),
        // ),
        // DropdownMenuItem<String>(
        //   value: loginAsList[3],
        //   child: Text(loginAsList[3]),
        // )
        // ],
        onChanged: (value) {
          dropdownValue = value!;
          setState(() {});
        });
  }
}
