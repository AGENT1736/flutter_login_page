import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String formEntry;
  final IconData? suffixIconData;
  bool? obscureText = false;

  CustomFormField(
      {super.key,
      required this.formEntry,
      this.obscureText,
      this.suffixIconData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText == null ? false : obscureText!,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIconData),
        iconColor: Colors.blue,
        labelText: formEntry,
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
