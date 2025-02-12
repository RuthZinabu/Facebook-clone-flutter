import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1_lab/join.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBa_rIbWOJB8ihrlgx5Z95OJvyKCuZmh5Q",
      authDomain: "facebook-clone-7a4d5.firebaseapp.com",
      projectId: "facebook-clone-7a4d5",
      storageBucket: "facebook-clone-7a4d5.firebasestorage.app",
      messagingSenderId: "521260815297",
      appId: "1:521260815297:web:d5779b6b73f8b93ce89540",
    ));
  } else {
    Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JoinFacebook(),
    );
  }
}
