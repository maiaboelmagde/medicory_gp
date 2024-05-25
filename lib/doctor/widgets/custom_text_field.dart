import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final Function(String value) onChange;
  const CustomTextField({super.key, required this.title, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 3),
      child: TextField(
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
