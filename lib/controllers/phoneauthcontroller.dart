import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CustomPhoneAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxBool isLoading = false.obs;
  final RxString verificationId = ''.obs;
  final RxString phoneNumber = ''.obs;
  final RxInt timerCount = 60.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerCount.value > 0) {
        timerCount.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  Future verifyPhoneNumber(String number) async {
    try {
      isLoading.value = true;
      phoneNumber.value = number;

      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          isLoading.value = false;
          print("Verification failed. Code: ${e.code}. Message: ${e.message}");
          Get.snackbar('Error', e.message ?? 'Verification failed');
        },
        codeSent: (String vId, int? resendToken) {
          verificationId.value = vId;
          isLoading.value = false;
          Get.toNamed('/otp');
          startTimer();
        },
        codeAutoRetrievalTimeout: (String vId) {
          verificationId.value = vId;
          isLoading.value = false;
        },
      );
    } catch (e) {
      isLoading.value = false;
      print("Error in verifyPhoneNumber: $e");
      Get.snackbar('Error', 'Failed to verify phone number');
    }
  }
  
  Future verifyOTP(String otp) async {
    if (verificationId.value.isEmpty || otp.isEmpty) {
      Get.snackbar('Error', 'Invalid OTP or verification session');
      return;
    }

    try {
      isLoading.value = true;

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );

      await _signInWithCredential(credential);
    } catch (e) {
      isLoading.value = false;
      print("Error in verifyOTP: $e");
      Get.snackbar('Error', 'Invalid OTP');
    }
  }

  Future _signInWithCredential(PhoneAuthCredential credential) async {
    try {
      final userCredential = await _auth.signInWithCredential(credential);
      isLoading.value = false;
      if (userCredential.user != null) {
        Get.offAllNamed('/welcome'); // Navigate to home screen after successful verification
      } else {
        Get.snackbar('Error', 'Failed to sign in');
      }
    } catch (e) {
      isLoading.value = false;
      print("Error in _signInWithCredential: $e");
      Get.snackbar('Error', 'Failed to sign in');
    }
  }


  void resendOTP() {
    verifyPhoneNumber(phoneNumber.value);
    timerCount.value = 60;
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}