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
    apiKey: 'AIzaSyDpoVT3vB4Lb7LhZ5ykE36rs8ehEN660xE',
    appId: '1:266329438760:web:8c1cd1a55341c66e2f131d',
    messagingSenderId: '266329438760',
    projectId: 'aim-construction-d864e',
    authDomain: 'aim-construction-d864e.firebaseapp.com',
    storageBucket: 'aim-construction-d864e.firebasestorage.app',
    measurementId: 'G-Q5TEZ05NGM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSen1-19i1c70mluQ3yZnmS1Px-Ualsbg',
    appId: '1:266329438760:android:d944786db1a9e72a2f131d',
    messagingSenderId: '266329438760',
    projectId: 'aim-construction-d864e',
    storageBucket: 'aim-construction-d864e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAL7skC3aCkDQuQIvSF_AKaqMuxyGc4pIM',
    appId: '1:266329438760:ios:dd57fbc34da54f2b2f131d',
    messagingSenderId: '266329438760',
    projectId: 'aim-construction-d864e',
    storageBucket: 'aim-construction-d864e.firebasestorage.app',
    iosBundleId: 'com.example.aimConstructionApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAL7skC3aCkDQuQIvSF_AKaqMuxyGc4pIM',
    appId: '1:266329438760:ios:dd57fbc34da54f2b2f131d',
    messagingSenderId: '266329438760',
    projectId: 'aim-construction-d864e',
    storageBucket: 'aim-construction-d864e.firebasestorage.app',
    iosBundleId: 'com.example.aimConstructionApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpoVT3vB4Lb7LhZ5ykE36rs8ehEN660xE',
    appId: '1:266329438760:web:c16c071873e359292f131d',
    messagingSenderId: '266329438760',
    projectId: 'aim-construction-d864e',
    authDomain: 'aim-construction-d864e.firebaseapp.com',
    storageBucket: 'aim-construction-d864e.firebasestorage.app',
    measurementId: 'G-1BFZ5WLJCN',
  );
}
