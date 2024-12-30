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
    apiKey: 'AIzaSyAZLK6mIM4Tfz3ilNYHc48F6LhKDR5uuzI',
    appId: '1:1092348125592:web:97b68ff1e2f11b3d458bed',
    messagingSenderId: '1092348125592',
    projectId: 'cargo-d847d',
    authDomain: 'cargo-d847d.firebaseapp.com',
    storageBucket: 'cargo-d847d.firebasestorage.app',
    measurementId: 'G-EHQ9M4LK9W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHgmlImqyHLhh8xo5UKaZdqNC_t_RCJU0',
    appId: '1:1092348125592:android:afc1bd48f73bc842458bed',
    messagingSenderId: '1092348125592',
    projectId: 'cargo-d847d',
    storageBucket: 'cargo-d847d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMm_Lw5uAqtHZ2FnpADx9UKjN5dry0Ibs',
    appId: '1:1092348125592:ios:a0bcefa4040061af458bed',
    messagingSenderId: '1092348125592',
    projectId: 'cargo-d847d',
    storageBucket: 'cargo-d847d.firebasestorage.app',
    iosBundleId: 'com.example.cargoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMm_Lw5uAqtHZ2FnpADx9UKjN5dry0Ibs',
    appId: '1:1092348125592:ios:a0bcefa4040061af458bed',
    messagingSenderId: '1092348125592',
    projectId: 'cargo-d847d',
    storageBucket: 'cargo-d847d.firebasestorage.app',
    iosBundleId: 'com.example.cargoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZLK6mIM4Tfz3ilNYHc48F6LhKDR5uuzI',
    appId: '1:1092348125592:web:12c4aac13244914a458bed',
    messagingSenderId: '1092348125592',
    projectId: 'cargo-d847d',
    authDomain: 'cargo-d847d.firebaseapp.com',
    storageBucket: 'cargo-d847d.firebasestorage.app',
    measurementId: 'G-6F2MXHNXL3',
  );
}