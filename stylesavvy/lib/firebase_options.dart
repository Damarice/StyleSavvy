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
    apiKey: 'AIzaSyA1rw41G9lWddEjdeAsYwgVmXy5OJ7XFo0',
    appId: '1:89347303550:web:c4db9692c30c713738502f',
    messagingSenderId: '89347303550',
    projectId: 'stylesavvy-64d65',
    authDomain: 'stylesavvy-64d65.firebaseapp.com',
    storageBucket: 'stylesavvy-64d65.appspot.com',
    measurementId: 'G-11P1KD5FR3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyPHX2CyimFuVJmFTTQiuWl1NNi-2Dp30',
    appId: '1:89347303550:android:94570df49293138e38502f',
    messagingSenderId: '89347303550',
    projectId: 'stylesavvy-64d65',
    storageBucket: 'stylesavvy-64d65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWTGCxfwaSquwHTiZUl2ojgwc8i6y-bgI',
    appId: '1:89347303550:ios:c647328cc5b657df38502f',
    messagingSenderId: '89347303550',
    projectId: 'stylesavvy-64d65',
    storageBucket: 'stylesavvy-64d65.appspot.com',
    iosClientId: '89347303550-t0ht9tqo7gifpgb1ajt89vonj2hjp8la.apps.googleusercontent.com',
    iosBundleId: 'com.example.stylesavvy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWTGCxfwaSquwHTiZUl2ojgwc8i6y-bgI',
    appId: '1:89347303550:ios:9b33c73b6b255a8138502f',
    messagingSenderId: '89347303550',
    projectId: 'stylesavvy-64d65',
    storageBucket: 'stylesavvy-64d65.appspot.com',
    iosClientId: '89347303550-8tnbl39fc10je49im4brd371q1h49c2p.apps.googleusercontent.com',
    iosBundleId: 'com.example.stylesavvy.RunnerTests',
  );
}
