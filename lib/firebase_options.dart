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
    apiKey: 'AIzaSyCGhqX0ib_tYi0SNmXKCsLkU8RdTkqm8RM',
    appId: '1:728404143406:web:6628376f7a37eeeef01ebf',
    messagingSenderId: '728404143406',
    projectId: 'devfolio-4d384',
    authDomain: 'devfolio-4d384.firebaseapp.com',
    storageBucket: 'devfolio-4d384.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBArJohRpAw3ZIy6c0s8NFwa21MYr_mcw4',
    appId: '1:728404143406:android:3393ea71d678a7e0f01ebf',
    messagingSenderId: '728404143406',
    projectId: 'devfolio-4d384',
    storageBucket: 'devfolio-4d384.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0YdgnndGbLnUE2sr_LplNmEQBvXfIXFQ',
    appId: '1:728404143406:ios:7f7f1bee8d737bcbf01ebf',
    messagingSenderId: '728404143406',
    projectId: 'devfolio-4d384',
    storageBucket: 'devfolio-4d384.appspot.com',
    iosBundleId: 'com.example.devFolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0YdgnndGbLnUE2sr_LplNmEQBvXfIXFQ',
    appId: '1:728404143406:ios:7f7f1bee8d737bcbf01ebf',
    messagingSenderId: '728404143406',
    projectId: 'devfolio-4d384',
    storageBucket: 'devfolio-4d384.appspot.com',
    iosBundleId: 'com.example.devFolio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCGhqX0ib_tYi0SNmXKCsLkU8RdTkqm8RM',
    appId: '1:728404143406:web:4096248fa1fce5a0f01ebf',
    messagingSenderId: '728404143406',
    projectId: 'devfolio-4d384',
    authDomain: 'devfolio-4d384.firebaseapp.com',
    storageBucket: 'devfolio-4d384.appspot.com',
  );
}
