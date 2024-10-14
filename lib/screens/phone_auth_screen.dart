import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Authify/screens/signin_screen.dart';
import 'package:lottie/lottie.dart';
import '../controllers/phoneauthcontroller.dart';

class PhoneAuthScreen extends StatelessWidget {
  final CustomPhoneAuthController controller = Get.put(CustomPhoneAuthController());
  final TextEditingController phoneController = TextEditingController();

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
              SizedBox(height: Get.height / 20),
              Center(
                child: Lottie.asset(
                  'assets/images/otp.json',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: Get.height / 25),
              Center(
                child: Text(
                  'Phone Verification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "We need to register your phone number before getting started!",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: '+92 300 1234567',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                    () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 40),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    final phone = phoneController.text.trim();
                    if (phone.isNotEmpty) {
                      controller.verifyPhoneNumber(phone);
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please enter a phone number',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: controller.isLoading.value
                      ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                      : Text("Send The Code"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}