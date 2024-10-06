// ignore_for_file: unused_local_variable

import 'package:fbs/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isloading = false;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> googleSignin() async {
    try {
      setState(() {
        isloading = true;
      });

      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      // final googleauth = await googleSignInAccount!.authentication;
      // final AuthCredential credential=GoogleAuthProvider.credential()
    } catch (e) {}
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  void login() async {
    try {
      setState(() {
        isLoading = true;
      });
      var crententaisl = await auth
          .signInWithEmailAndPassword(email: email.text, password: pass.text)
          .then((value) {
        print(value);

        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login '),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: email,
            decoration: InputDecoration(
                hintText: 'Email',
                label: Text('Email'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: pass,
            decoration: InputDecoration(
                hintText: 'Password',
                label: Text('Password'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () async {
                    googleSignin();
                  },
                  child: isLoading == true
                      ? CircularProgressIndicator()
                      : Text('Login'))),
        ],
      ),
    );
  }
}
