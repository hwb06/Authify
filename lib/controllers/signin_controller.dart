import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Authify/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // //For password visibility
  // final RxBool isPasswordVisible = true.obs;

  Future<UserCredential?> signInMethod(
      String userEmail,
      String userPassword,

      ) async {
    try {
      EasyLoading.show(status: "Please Wait..");
      UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);


      EasyLoading.dismiss();
      return userCredential;

    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
