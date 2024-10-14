import 'dart:async';
import 'package:Authify/controllers/get_user_data_controller.dart';
import 'package:Authify/screens/onboarding_screen.dart';
import 'package:Authify/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// Splash Screen class which shows an animation and navigates to the MainScreen after 3 seconds
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// State class for SplashScreen
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => OnboardingScreen() ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color to AppSecondaryColor
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0, // Remove shadow under the app bar
      ),
      body: Container(
        child: Column(
          children: [
            // Expanded widget to make the Lottie animation take up available space
            Expanded(
              child: Container(
                alignment: Alignment.center, // Center the animation
                width: Get.width / 2.0, // Full screen width
                // Load and display the Lottie animation asset
                child: Lottie.asset("assets/images/authlottie.json"),
              ),
            ),
            // Text widget at the bottom of the screen showing 'Powered by' message
            Container(
              margin: EdgeInsets.only(bottom: 30), // Add space below the text
              width: Get.width, // Full screen width
              alignment: Alignment.center, // Center the text
              child: Text(
                "Authify", // Powered by text
                style: TextStyle(
                    fontSize: 20, // Set font size
                    color: Colors.white, // Set text color
                    fontWeight: FontWeight.bold // Make the text bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
