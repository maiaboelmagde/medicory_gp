import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final Function(String data) onchange;
  const SearchTextField({super.key, required this.onchange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchange,
      decoration: InputDecoration(
          hintText: 'Search by name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          suffixIcon: const Icon(Icons.search)),
    );
  }
}
