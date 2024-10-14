import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Authify/screens/signin_screen.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController _controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Obx(() {
        final currentIndex =
            _controller.currentIndex.value; // Current index controller
        final currentPage = _controller.pages[currentIndex];
        final isLastPage = currentIndex == _controller.pages.length - 1;

        return Container(
          color: theme.scaffoldBackgroundColor,
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(currentPage.imagePath, height: 250),
                    SizedBox(height: 20),
                    Text(
                      currentPage.title,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        currentPage.description,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(350, 40),
                      ),
                      onPressed: _controller.nextPage,
                      child: Text(
                        isLastPage ? 'Sign Up' : 'Next',
                      ),
                    ),
                    SizedBox(height: 15),
                    if (isLastPage)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.offAll(() => SigninScreen());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                // Later For Last Screen
                if (isLastPage)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: TextButton.icon(
                      onPressed: _controller.skipOnboarding,
                      icon: Text(
                        'Later',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      label: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),

                // For Skip button
                if (currentPage.isSkippable)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: TextButton.icon(
                      onPressed: _controller.skipOnboarding,
                      icon: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      label: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),

                //For Back Button
                if (currentIndex > 0)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: TextButton(
                      onPressed: () {
                        _controller
                            .previousPage(); // Pehle page par jane ke liye
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
