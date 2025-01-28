import 'package:Authify/theme_toggle_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Authify/screens/onboarding_screen.dart';
import 'package:Authify/screens/otp_verification_screen.dart';
import 'package:Authify/screens/phone_auth_screen.dart';
import 'package:Authify/screens/signin_screen.dart';
import 'package:Authify/screens/signup_screen.dart';
import 'package:Authify/screens/welcome_screen.dart';
import 'package:Authify/screens/splash_screen.dart';

import 'app_theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
        GetPage(name: '/phoneauth', page: () => PhoneAuthScreen()),
        GetPage(name: '/otp', page: () => OTPVerificationScreen()),
        GetPage(name: '/themeToggle', page: () => ThemeToggleScreen()),
        GetPage(name: '/signin', page: () => SigninScreen()),
        GetPage(name: '/signup', page: () => SignupScreen()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Google Auth',
      theme: AppTheme.darkTheme(), // Using the custom dark theme
      home: SigninScreen(),
      builder: EasyLoading.init(),
    );
  }
}