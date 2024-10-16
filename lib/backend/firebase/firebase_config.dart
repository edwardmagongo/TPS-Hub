import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDozjEgqqDnYPybzVPWF8rP8jbWo7822H0",
            authDomain: "tpshub-381be.firebaseapp.com",
            projectId: "tpshub-381be",
            storageBucket: "tpshub-381be.appspot.com",
            messagingSenderId: "299456452647",
            appId: "1:299456452647:web:327930418f05edd4099602",
            measurementId: "G-QCP33M816E"));
  } else {
    await Firebase.initializeApp();
  }
}
