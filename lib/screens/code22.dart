import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController email = TextEditingController();

  bool isloading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> forgetPass() async {
    try {
      setState(() {
        isloading = true;
      });

      final authCredential =
          await auth.sendPasswordResetEmail(email: email.text).then((value) {
        // ScaffoldMessenger.of(context).showSnackBar()
      });
    } catch (e) {}
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget password'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: Color.fromARGB(255, 46, 244, 52),
                  ),
                  label: Text("Enter your email"),
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
                onPressed: () {
                  if (email.text.isNotEmpty) {
                    forgetPass();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Enter your email ')));
                  }
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 66, 248, 16))),
                child: isloading == true
                    ? CircularProgressIndicator()
                    : Text(
                        "Submit",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      )),
          )
        ],
      ),
    );
  }
}
