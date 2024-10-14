// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBHZ3rjgW3CWvaEn_-vlp8lroHrg48ft8s',
    appId: '1:700222830069:web:80f4f3a108ebe12a869cbc',
    messagingSenderId: '700222830069',
    projectId: 'auth-eb0a2',
    authDomain: 'auth-eb0a2.firebaseapp.com',
    storageBucket: 'auth-eb0a2.appspot.com',
    measurementId: 'G-H7167XW8DS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASSJQh3lt-lKivu_aVjsr1DFnkBIc3aKg',
    appId: '1:700222830069:android:c373446a812b8ce7869cbc',
    messagingSenderId: '700222830069',
    projectId: 'auth-eb0a2',
    storageBucket: 'auth-eb0a2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIeG5-nefcrd_CrEVvArcntu6Tj6uyJx8',
    appId: '1:700222830069:ios:f3f901611db0aacb869cbc',
    messagingSenderId: '700222830069',
    projectId: 'auth-eb0a2',
    storageBucket: 'auth-eb0a2.appspot.com',
    iosBundleId: 'com.example.googleAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIeG5-nefcrd_CrEVvArcntu6Tj6uyJx8',
    appId: '1:700222830069:ios:f3f901611db0aacb869cbc',
    messagingSenderId: '700222830069',
    projectId: 'auth-eb0a2',
    storageBucket: 'auth-eb0a2.appspot.com',
    iosBundleId: 'com.example.googleAuth',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBHZ3rjgW3CWvaEn_-vlp8lroHrg48ft8s',
    appId: '1:700222830069:web:22719449861b0242869cbc',
    messagingSenderId: '700222830069',
    projectId: 'auth-eb0a2',
    authDomain: 'auth-eb0a2.firebaseapp.com',
    storageBucket: 'auth-eb0a2.appspot.com',
    measurementId: 'G-3QEXSCWREZ',
  );
}
