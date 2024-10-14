import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:Authify/controllers/forget_password_controller.dart';
import 'package:Authify/screens/signin_screen.dart';
import 'package:Authify/screens/signup_screen.dart';
import 'package:Authify/screens/welcome_screen.dart';
import 'package:Authify/screens/signup_screen.dart';
import 'package:Authify/screens/welcome_screen.dart';
import '../controllers/get_user_data_controller.dart';
import '../controllers/signin_controller.dart';
import '../ui_widgets/custom_text_field.dart';
import '../ui_widgets/social_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());

  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Get.offAll(() => SigninScreen());
                },
              ),
              SizedBox(height: Get.height / 7),
              Center(
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "No Worries, We'll send you reset instructions.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: userEmail,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 34),
              ElevatedButton(
                onPressed: () async {
                  String email = userEmail.text.trim(); // Email ko trim karna

                  if (email.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please Enter Your Email",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                    await forgetPasswordController.ForgetPasswordMethod(email);

                    Get.offAll(() => SigninScreen());
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 30),
                ),
                child: const Text('Reset Password'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Get.offAll(() => SigninScreen());
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        'Back To Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
