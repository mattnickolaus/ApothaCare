import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBSW3BqIr9J0vNMCMhjnYbuX3s8eiWbU38",
            authDomain: "apotha-care-h5edpz.firebaseapp.com",
            projectId: "apotha-care-h5edpz",
            storageBucket: "apotha-care-h5edpz.appspot.com",
            messagingSenderId: "94645696985",
            appId: "1:94645696985:web:ae81a384bd393a729581c8"));
  } else {
    await Firebase.initializeApp();
  }
}
