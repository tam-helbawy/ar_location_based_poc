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
    apiKey: 'AIzaSyCDgT-s9mE9UMLSzkMw1FGhTJHdF7WwU9s',
    appId: '1:102450018426:web:d03c15a7a1ea13dcbde3c3',
    messagingSenderId: '102450018426',
    projectId: 'innova-office-guide',
    authDomain: 'innova-office-guide.firebaseapp.com',
    storageBucket: 'innova-office-guide.firebasestorage.app',
    measurementId: 'G-BF806N0917',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAP30H4eNL4UC6-rcCOa4R7gLJQPSnYCjY',
    appId: '1:102450018426:android:9a363493a61ae4cdbde3c3',
    messagingSenderId: '102450018426',
    projectId: 'innova-office-guide',
    storageBucket: 'innova-office-guide.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6Q7Ol0_FA4q2boxeYIlOfloP_uAHWTGY',
    appId: '1:102450018426:ios:5397739ac84976e8bde3c3',
    messagingSenderId: '102450018426',
    projectId: 'innova-office-guide',
    storageBucket: 'innova-office-guide.firebasestorage.app',
    iosBundleId: 'com.example.base',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6Q7Ol0_FA4q2boxeYIlOfloP_uAHWTGY',
    appId: '1:102450018426:ios:5397739ac84976e8bde3c3',
    messagingSenderId: '102450018426',
    projectId: 'innova-office-guide',
    storageBucket: 'innova-office-guide.firebasestorage.app',
    iosBundleId: 'com.example.base',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCDgT-s9mE9UMLSzkMw1FGhTJHdF7WwU9s',
    appId: '1:102450018426:web:8444bc6f23edc448bde3c3',
    messagingSenderId: '102450018426',
    projectId: 'innova-office-guide',
    authDomain: 'innova-office-guide.firebaseapp.com',
    storageBucket: 'innova-office-guide.firebasestorage.app',
    measurementId: 'G-1CHQXCLG9K',
  );
}
