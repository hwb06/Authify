import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Authify/controllers/get_device_token_controller.dart';
import 'package:Authify/models/user_model.dart';
import 'package:Authify/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Authify/theme_toggle_screen.dart';


class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    final GetDeviceTokenController getDeviceTokenController = Get.put(GetDeviceTokenController());
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        EasyLoading.show(status: "Please wait...");
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          UserModel userModel = UserModel(
            uId: user.uid,
            username: user.displayName.toString(),
            email: user.email.toString(),
            password: user.phoneNumber.toString(),
            userDeviceToken: getDeviceTokenController.deviceToken.toString() ,
            isAdmin: false,
            isActive: true,
            createdOn: DateTime.now(),
          );

          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());

          EasyLoading.dismiss();
          Get.offAll(() => ThemeToggleScreen());
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("error $e");
    }
  }
}
