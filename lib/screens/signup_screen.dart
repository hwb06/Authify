import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:Authify/screens/phone_auth_screen.dart';
import 'package:Authify/screens/signin_screen.dart';
import 'package:Authify/screens/welcome_screen.dart';
import 'package:Authify/services/notification_service.dart';
import 'package:Authify/ui_widgets/custom_text_field.dart';
import 'package:Authify/ui_widgets/social_button.dart';

import '../controllers/facebook_login_controller.dart';
import '../controllers/google_signin_controller.dart';
import '../controllers/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignUpController signUpController = Get.put(SignUpController());

  //For password visibility
  final RxBool isPasswordVisible = true.obs;

  final NotificationService notificationService =
      Get.put(NotificationService());

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  final FacebookLoginController _facebookController =
      Get.put(FacebookLoginController());

  TextEditingController username = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

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
              const SizedBox(height: 24),
              Text(
                'Get your free account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 32),
              SocialButton(
                text: 'Continue with Phone',
                icon: 'assets/images/otp.svg',
                onPressed: () {
                  Get.offAll(() => PhoneAuthScreen());
                },
              ),
              const SizedBox(height: 16),
              SocialButton(
                text: 'Continue with Google',
                icon: 'assets/images/google_logo.svg',
                onPressed: () {
                  _googleSignInController.signInWithGoogle();
                },
              ),
              const SizedBox(height: 24),
              const Center(child: Text('OR')),
              const SizedBox(height: 24),
              CustomTextField(
                controller: username,
                hintText: 'Username',
                keyboardType: TextInputType.name,
                prefixIcon: Icons.verified_user,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: userEmail,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 24),
              Obx(() => CustomTextField(
                    controller: userPassword,
                    hintText: 'Password',
                    obscureText: !isPasswordVisible.value,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    isPasswordVisible: isPasswordVisible,
                  )),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  String name = username.text.trim();
                  String email = userEmail.text.trim();
                  String password = userPassword.text.trim();
                  String? userDeviceToken =
                      await notificationService.getDeviceToken();

                  if (name.isEmpty || email.isEmpty || password.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please Enter All Details",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                    UserCredential? userCredential =
                        await signUpController.signUpMethod(
                      name,
                      email,
                      password,
                      userDeviceToken ?? '',
                    );

                    if (userCredential != null) {
                      Get.snackbar(
                        "Verification Email Sent",
                        "Please Check Your Email",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(() => SigninScreen());
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Sign up'),
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
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
