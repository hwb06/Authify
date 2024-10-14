import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Authify/controllers/google_signin_controller.dart';
import 'package:Authify/screens/forget_password_screen.dart';
import 'package:Authify/screens/onboarding_screen.dart';
import 'package:Authify/screens/phone_auth_screen.dart';
import 'package:Authify/screens/signup_screen.dart';
import 'package:Authify/screens/welcome_screen.dart';
import '../controllers/get_user_data_controller.dart';
import '../controllers/signin_controller.dart';
import '../ui_widgets/custom_text_field.dart';
import '../ui_widgets/social_button.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController = Get.put(GetUserDataController());

  // For password visibility
  final RxBool isPasswordVisible = true.obs;

  final GoogleSignInController _googleSignInController = Get.put(GoogleSignInController());

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
                  Get.offAll(() => OnboardingScreen());
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Log in to Scale',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: userEmail,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 16),
              Obx(() => CustomTextField(
                controller: userPassword,
                hintText: 'Password',
                obscureText: !isPasswordVisible.value,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.lock,
                isPasswordVisible: isPasswordVisible,
              )),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.offAll(() => ForgetPasswordScreen());
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  String email = userEmail.text.trim();
                  String password = userPassword.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please enter all details",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                    UserCredential? userCredential =
                    await signInController.signInMethod(email, password);

                    if (userCredential != null) {
                      var userData = await getUserDataController
                          .getUserData(userCredential.user!.uid);

                      if (userCredential.user!.emailVerified) {
                        if (userData[0]['isAdmin'] == true) {
                          Get.snackbar(
                            "Success Admin Login",
                            "login Successfully!",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                          Get.offAll(() => WelcomeScreen());
                        } else {
                          Get.offAll(() => WelcomeScreen());
                          Get.snackbar(
                            "Success User Login",
                            "login Successfully!",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                        }
                      } else {
                        Get.snackbar(
                          "Error",
                          "Please verify your email before login",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    } else {
                      Get.snackbar(
                        "Error",
                        "Please try again",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 24),
              const Center(child: Text('OR')),
              const SizedBox(height: 24),
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
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: const [
                        TextSpan(
                          text: 'Signup',
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
