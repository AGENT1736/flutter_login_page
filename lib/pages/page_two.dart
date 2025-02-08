import 'package:flutter/material.dart';
import 'package:ict_hub_session/pages/page_one.dart';

import '../Widgets/custom_form_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isFirstObscured = false;
  bool isSecondObscured = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Text(
                    "Register!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: CustomFormField(formEntry: "Username"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: CustomFormField(formEntry: "Email"),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: CustomFormField(
                  suffixIconData:
                      isFirstObscured ? Icons.visibility : Icons.visibility_off,
                  formEntry: "Password",
                  obscureText: isFirstObscured,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: CustomFormField(
                  suffixIconData: isSecondObscured
                      ? Icons.visibility
                      : Icons.visibility_off,
                  formEntry: "Confirm Password",
                  obscureText: isSecondObscured,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 50),
                    backgroundColor: Colors.lightGreen[600],
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "already have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Login",
                            style: TextStyle(
                              color: Colors.lightGreen[600],
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
