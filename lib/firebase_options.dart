// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAB0GWQYQeSvomGLNCnTCbMxK3-97UUwKE',
    appId: '1:991175729431:web:f881b5f56b8c7aee069752',
    messagingSenderId: '991175729431',
    projectId: 'job-timer-proj',
    authDomain: 'job-timer-proj.firebaseapp.com',
    storageBucket: 'job-timer-proj.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRg274w9-ZbDdS-XIxoYMzWAhncF0a-os',
    appId: '1:991175729431:android:35549b471801e3cb069752',
    messagingSenderId: '991175729431',
    projectId: 'job-timer-proj',
    storageBucket: 'job-timer-proj.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0ipwALSJzdVoCRKJ5lj5db4RgKzAYQ4E',
    appId: '1:991175729431:ios:957ba5485e78a8f0069752',
    messagingSenderId: '991175729431',
    projectId: 'job-timer-proj',
    storageBucket: 'job-timer-proj.appspot.com',
    iosClientId: '991175729431-ppip37e3kai3lipd647fghe53d7nkhqd.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobTimer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC0ipwALSJzdVoCRKJ5lj5db4RgKzAYQ4E',
    appId: '1:991175729431:ios:957ba5485e78a8f0069752',
    messagingSenderId: '991175729431',
    projectId: 'job-timer-proj',
    storageBucket: 'job-timer-proj.appspot.com',
    iosClientId: '991175729431-ppip37e3kai3lipd647fghe53d7nkhqd.apps.googleusercontent.com',
    iosBundleId: 'com.example.jobTimer',
  );
}