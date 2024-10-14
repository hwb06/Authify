import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FacebookLoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await _facebookAuth.login();

      if (loginResult.status == LoginStatus.success) {
        // Use tokenString instead of token
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
        final userCredential = await _auth.signInWithCredential(facebookAuthCredential);

        final userData = await _facebookAuth.getUserData();

        // Create or update user in Firestore
        final user = UserModel(
          uId: userCredential.user!.uid,
          username: userData['name'] ?? '',
          email: userData['email'] ?? '',
          password: '', // Facebook login doesn't provide password
          userDeviceToken: '', // You need to implement device token logic
          isAdmin: false,
          isActive: true,
          createdOn: Timestamp.now(),
        );

        await _firestore.collection('users').doc(user.uId).set(user.toMap());

        currentUser.value = user;
      }
    } catch (e) {
      print("Facebook login error: $e");
      // You might want to show an error message to the user here
      Get.snackbar('Error', 'Failed to login with Facebook: ${e.toString()}');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _facebookAuth.logOut();
    currentUser.value = null;
  }
}