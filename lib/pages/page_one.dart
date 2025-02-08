import 'package:flutter/material.dart';
import 'package:ict_hub_session/Widgets/custom_form_field.dart';
import 'package:ict_hub_session/pages/page_two.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                  "Login to \nyour account!",
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
              child: CustomFormField(formEntry: "Password"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    print("Forgor Password?");
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.lightGreen[600]),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 50),
                backgroundColor: Colors.lightGreen[600],
              ),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Logged in with google");
                    },
                    child: Text(
                      "Login with google",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Logged in with facebook");
                    },
                    child: Text(
                      "Login with facebook",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationScreen(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Register",
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
    );
  }
}
