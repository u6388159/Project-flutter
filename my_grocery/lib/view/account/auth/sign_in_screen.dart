import 'package:flutter/material.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/extention/string_extention.dart';

import '../../../component/input_outline_button.dart';
import '../../../component/input_text_button.dart';
import '../../../component/input_text_field.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the text editing controllers when the widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add some vertical spacing at the top of the screen
                const Spacer(),
                // Display the "Welcome" title
                const Text("Welcome,",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                // Display the "Sign in to continue!" subtitle
                const Text(
                  "Sign in to continue!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2),
                ),
                // Add more vertical spacing
                const Spacer(
                  flex: 3,
                ),
                // Display the email input field
                InputTextField(
                  title: 'Email',
                  textEditingController: emailController,
                  // Perform validation on the input
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (!value.isValidEmail) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                // Display the password input field
                InputTextField(
                  title: 'Password',
                  obsecureText: true,
                  textEditingController: passwordController,
                  // Perform validation on the input
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                // Display the "Forgot Password" link
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
                // Add more vertical spacing
                const Spacer(),
                // Display the "Sign In" button
                InputTextButton(
                  title: "Sign In",
                  onClick: () {
                    // If the form is valid, attempt to sign in
                    if (_formKey.currentState!.validate()) {
                      authController.signIn(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                ),
                const SizedBox(height: 10),
                InputOutlineButton(
                  title: "Back",
                  onClick: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer(
                  flex: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I'm new user, "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
