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
    apiKey: 'AIzaSyDSXSPys45Fp_ZnYJ_1dGTqg2SVW0AEKIU',
    appId: '1:174464349872:web:e29abc9ef8168415796d75',
    messagingSenderId: '174464349872',
    projectId: 'pushgears-dev',
    authDomain: 'pushgears-dev.firebaseapp.com',
    storageBucket: 'pushgears-dev.appspot.com',
    measurementId: 'G-FB0F88YGZC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC26kJrxf3bcJVcTsLScVtL00BWpHqXnuk',
    appId: '1:174464349872:android:5dab2b54db221432796d75',
    messagingSenderId: '174464349872',
    projectId: 'pushgears-dev',
    storageBucket: 'pushgears-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzGPPRr8RY7xgDkq_2cyLDQOy99_MtZcM',
    appId: '1:174464349872:ios:700e512cae0d5028796d75',
    messagingSenderId: '174464349872',
    projectId: 'pushgears-dev',
    storageBucket: 'pushgears-dev.appspot.com',
    iosClientId: '174464349872-ib720v5mhhhlbk8ie7hhl7aofnkjluat.apps.googleusercontent.com',
    iosBundleId: 'com.example.lachule',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzGPPRr8RY7xgDkq_2cyLDQOy99_MtZcM',
    appId: '1:174464349872:ios:700e512cae0d5028796d75',
    messagingSenderId: '174464349872',
    projectId: 'pushgears-dev',
    storageBucket: 'pushgears-dev.appspot.com',
    iosClientId: '174464349872-ib720v5mhhhlbk8ie7hhl7aofnkjluat.apps.googleusercontent.com',
    iosBundleId: 'com.example.lachule',
  );
}
