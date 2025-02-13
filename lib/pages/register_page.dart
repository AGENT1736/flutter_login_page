import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_session/cubit/auth_cubit.dart';
import 'package:ict_hub_session/cubit/auth_states.dart';
//import 'package:ict_hub_session/pages/login_page.dart';

import '../Widgets/custom_form_field.dart';
import '../features/bottom_nav.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isFirstObscured = false;

  bool isSecondObscured = false;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController usernameController = TextEditingController();

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
                child: CustomFormField(
                  formEntry: "Username",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "username is required";
                    }
                    return null;
                  },
                  textEditingController: usernameController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: CustomFormField(
                  formEntry: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required!";
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  textEditingController: emailController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: CustomFormField(
                  suffixIconData:
                      isFirstObscured ? Icons.visibility : Icons.visibility_off,
                  formEntry: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required!";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters!";
                    }
                    return null;
                  },
                  obscureText: isFirstObscured,
                  textEditingController: passwordController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "You need to confirm your password!";
                    }
                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  textEditingController: confirmPasswordController,
                  obscureText: isSecondObscured,
                ),
              ),

              //this is the bloc consumer widget for the button that is used to register an account
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: BlocConsumer<AuthCubit, AuthStates>(
                  listener: (context, state) {
                    if (state is AuthSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registration successful")));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavPage()));
                    } else if (state is AuthErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Registration Failed, Please Try again!")));
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        String username = usernameController.toString();
                        String email = emailController.toString();
                        String password = passwordController.toString();
                        String confirmPassword =
                            confirmPasswordController.toString();

                        if (password == confirmPassword) {
                          context
                              .read<AuthCubit>()
                              .register(email, username, password);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Passwords do not match!")),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(300, 50),
                        backgroundColor: Colors.lightGreen[600],
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
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
