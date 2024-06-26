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
    apiKey: 'AIzaSyDTRflYRYnleGoG9jl02J3ImAUBvWarTAk',
    appId: '1:987066823723:web:ac18a29705876d4c17a66e',
    messagingSenderId: '987066823723',
    projectId: 'prosper-jibunor-new-project',
    authDomain: 'prosper-jibunor-new-project.firebaseapp.com',
    storageBucket: 'prosper-jibunor-new-project.appspot.com',
    measurementId: 'G-RVF2T9SBSL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKeizLo4k8sS2UJCIjyCqwmeZQ7IoaSVk',
    appId: '1:987066823723:android:55dac18eda6a202017a66e',
    messagingSenderId: '987066823723',
    projectId: 'prosper-jibunor-new-project',
    storageBucket: 'prosper-jibunor-new-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDM9gyY1zpwG0nIUgvtGXVit4MLVkoU3-s',
    appId: '1:987066823723:ios:b0056b5cb49cde8117a66e',
    messagingSenderId: '987066823723',
    projectId: 'prosper-jibunor-new-project',
    storageBucket: 'prosper-jibunor-new-project.appspot.com',
    iosBundleId: 'com.example.happeFinal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDM9gyY1zpwG0nIUgvtGXVit4MLVkoU3-s',
    appId: '1:987066823723:ios:b0056b5cb49cde8117a66e',
    messagingSenderId: '987066823723',
    projectId: 'prosper-jibunor-new-project',
    storageBucket: 'prosper-jibunor-new-project.appspot.com',
    iosBundleId: 'com.example.happeFinal',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDTRflYRYnleGoG9jl02J3ImAUBvWarTAk',
    appId: '1:987066823723:web:84e09254ecb1970b17a66e',
    messagingSenderId: '987066823723',
    projectId: 'prosper-jibunor-new-project',
    authDomain: 'prosper-jibunor-new-project.firebaseapp.com',
    storageBucket: 'prosper-jibunor-new-project.appspot.com',
    measurementId: 'G-NXFFT3Y407',
  );
}
