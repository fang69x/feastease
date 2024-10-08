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
    apiKey: 'AIzaSyCH9p_vzPHnMMpEqGkstuo1KG0Mkb9gJ1c',
    appId: '1:286197171680:web:b7758bc7814a82ad99d785',
    messagingSenderId: '286197171680',
    projectId: 'feastease',
    authDomain: 'feastease.firebaseapp.com',
    storageBucket: 'feastease.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQyC-yzzC4QO6MiKuHxZlQ864Hv80Ohig',
    appId: '1:286197171680:android:c46d7fe3d4389b5f99d785',
    messagingSenderId: '286197171680',
    projectId: 'feastease',
    storageBucket: 'feastease.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQDrDSwjAkqjfRIx4_yFPXc-46lembT9E',
    appId: '1:286197171680:ios:2efb6bc43add0c8d99d785',
    messagingSenderId: '286197171680',
    projectId: 'feastease',
    storageBucket: 'feastease.appspot.com',
    iosClientId: '286197171680-5muqckv7fne4dn389lt8vmr2edd27pgf.apps.googleusercontent.com',
    iosBundleId: 'com.example.feastease',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQDrDSwjAkqjfRIx4_yFPXc-46lembT9E',
    appId: '1:286197171680:ios:2efb6bc43add0c8d99d785',
    messagingSenderId: '286197171680',
    projectId: 'feastease',
    storageBucket: 'feastease.appspot.com',
    iosClientId: '286197171680-5muqckv7fne4dn389lt8vmr2edd27pgf.apps.googleusercontent.com',
    iosBundleId: 'com.example.feastease',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCH9p_vzPHnMMpEqGkstuo1KG0Mkb9gJ1c',
    appId: '1:286197171680:web:f8c5cb1b1c25995e99d785',
    messagingSenderId: '286197171680',
    projectId: 'feastease',
    authDomain: 'feastease.firebaseapp.com',
    storageBucket: 'feastease.appspot.com',
  );
}
