import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String message = "Not Verified";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: nameController,
            ),
            TextFormField(
              controller: passController,
            ),
            Text(message),
            ElevatedButton(
                onPressed: () {
                  _auth
                      .createUserWithEmailAndPassword(
                          email: nameController.text,
                          password: passController.text)
                      .then((value) {
                    _auth.currentUser!.sendEmailVerification();
                  });
                },
                child: const Text("Sign In")),
            ElevatedButton(
                onPressed: () {
                  _auth.currentUser!.reload();
                  print(_auth.currentUser!.email);
                  print(_auth.currentUser!.emailVerified);
                  if (_auth.currentUser!.emailVerified) {
                    message = "Verified";
                    print("verified");
                    setState(() {});
                  }
                },
                child: const Text("Is Verified?")),
          ],
        ),
      ),
    );
  }
}
