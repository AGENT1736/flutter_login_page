import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String formEntry;
  final IconData? suffixIconData;
  bool? obscureText = false;
  Function? function;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;

  CustomFormField(
      {super.key,
      required this.formEntry,
      this.obscureText,
      this.suffixIconData,
      this.textEditingController,
      this.function,
      this.validator});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: isObscure,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(widget.suffixIconData),
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
        ),
        iconColor: Colors.blue,
        labelText: widget.formEntry,
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
