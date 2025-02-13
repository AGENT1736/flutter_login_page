import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_session/Widgets/custom_form_field.dart';
import 'package:ict_hub_session/cubit/auth_states.dart';
import 'package:ict_hub_session/features/bottom_nav.dart';
import 'package:ict_hub_session/pages/register_page.dart';
import '../cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              alignment: Alignment.bottomLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
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
              child: CustomFormField(
                formEntry: "Email",
                textEditingController: emailController,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: CustomFormField(
                formEntry: "Password",
                textEditingController: passwordController,
                obscureText: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    print("Forgot Password?");
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.lightGreen[600]),
                  ),
                )
              ],
            ),
            BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is AuthSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login Successful!")),
                  );

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BottomNavPage()));
                } else if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Login Failed. Please try again.")),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    context.read<AuthCubit>().login(email, password);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    backgroundColor: Colors.lightGreen[600],
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Logged in with Google");
                    },
                    child: const Text(
                      "Login with Google",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Logged in with Facebook");
                    },
                    child: const Text(
                      "Login with Facebook",
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
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Register",
                        style: TextStyle(
                          color: Colors.lightGreen[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
