// onboarding_controller.dart

import 'package:get/get.dart';
import '../models/onboarding_model.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'Secure and Flexible Auth.',
      description: 'Authify allows you to log in easily and securely using multiple methods like email/password, Google, or phone authentication. Choose what works best for you.',
      imagePath: 'assets/images/securelogin.png',
      isSkippable: true,
    ),
    OnboardingModel(
      title: 'Sign In Your Way',
      description: 'With Authify, you can sign in using your preferred method: Google, phone authentication, or traditional email and password. Your choice, your convenience.',
      imagePath: 'assets/images/loginauth.png',
      isSkippable: true,
    ),
    OnboardingModel(
      title: 'Quick and Easy Sign-Up',
      description: 'Create your account in no time with multiple sign-up options. Use your email, phone number, or Google account and get started with Authify in just a few taps.',
      imagePath: 'assets/images/easysignup.png',
      isSkippable: false,
    ),
  ];

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      currentIndex++;
    } else {
      completeOnboarding();
    }
  }

  // Method to go to the previous page
  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  void completeOnboarding() {
    Get.offAllNamed('/signup');
  }
}