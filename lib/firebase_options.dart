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
    apiKey: 'AIzaSyBAYBsZ-XgxhCLDSjI4YqmlrD6TeQ6lFao',
    appId: '1:1080160990612:web:51f852d8c2e09d624e0b81',
    messagingSenderId: '1080160990612',
    projectId: 'fir-pushnotifications-53ab4',
    authDomain: 'fir-pushnotifications-53ab4.firebaseapp.com',
    storageBucket: 'fir-pushnotifications-53ab4.firebasestorage.app',
    measurementId: 'G-5YVML447DS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_UMqG7dCp44kypcYMx9XUldbvPo8bOl4',
    appId: '1:1080160990612:android:63f685ef198caa7d4e0b81',
    messagingSenderId: '1080160990612',
    projectId: 'fir-pushnotifications-53ab4',
    storageBucket: 'fir-pushnotifications-53ab4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnfGTNnUFN3HcVPyWyIl3tiJb09HknrPk',
    appId: '1:1080160990612:ios:b0b01b80208fc1c34e0b81',
    messagingSenderId: '1080160990612',
    projectId: 'fir-pushnotifications-53ab4',
    storageBucket: 'fir-pushnotifications-53ab4.firebasestorage.app',
    iosBundleId: 'com.example.appNotificaciones',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnfGTNnUFN3HcVPyWyIl3tiJb09HknrPk',
    appId: '1:1080160990612:ios:b0b01b80208fc1c34e0b81',
    messagingSenderId: '1080160990612',
    projectId: 'fir-pushnotifications-53ab4',
    storageBucket: 'fir-pushnotifications-53ab4.firebasestorage.app',
    iosBundleId: 'com.example.appNotificaciones',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBAYBsZ-XgxhCLDSjI4YqmlrD6TeQ6lFao',
    appId: '1:1080160990612:web:884ed5dd6002fbce4e0b81',
    messagingSenderId: '1080160990612',
    projectId: 'fir-pushnotifications-53ab4',
    authDomain: 'fir-pushnotifications-53ab4.firebaseapp.com',
    storageBucket: 'fir-pushnotifications-53ab4.firebasestorage.app',
    measurementId: 'G-62YM35HL8C',
  );
}