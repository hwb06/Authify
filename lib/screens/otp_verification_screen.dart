import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/phoneauthcontroller.dart';

class OTPVerificationScreen extends StatelessWidget {
  final CustomPhoneAuthController controller = Get.find();
  final TextEditingController otpController = TextEditingController();

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
                onPressed: () => Get.back(),
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
                  'OTP Verification',
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
                    "Enter the OTP sent to your phone number",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                  hintText: '6-digit code',
                  prefixIcon: Icon(Icons.security),
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
              ),
              SizedBox(height: 20),
              Obx(
                    () => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                    if (otpController.text.length == 6) {
                      controller.verifyOTP(otpController.text);
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please enter a valid 6-digit OTP',
                        snackPosition: SnackPosition.BOTTOM,
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
                      : Text('Verify OTP'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Obx(() => Text(
                  'Resend OTP in ${controller.timerCount} seconds',
                  style: TextStyle(fontSize: 14),
                )),
              ),
              SizedBox(height: 10),
              Center(
                child: Obx(() => TextButton(
                  onPressed: controller.timerCount.value == 0
                      ? controller.resendOTP
                      : null,
                  child: Text('Resend OTP'),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}