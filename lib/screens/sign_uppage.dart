// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:fbs/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool mark = false;
  bool isPAss = true;

  bool isLoading = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  Future<void> signUp() async {
    try {
      setState(() {
        isLoading = true;
      });
      var user = await auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Sign Up Successfully')));
        setState(() {
          isLoading = false;
        });

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error in sign up $e')));
      debugPrint('Error in sign up $e');
      setState(() {
        isLoading = false;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(top: const Radius.circular(50)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Hello!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "User Name",
                          prefixIcon: Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextField(
                      obscureText: isPAss,
                      controller: password,
                      decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPAss = !isPAss;
                                });
                              },
                              icon: Icon(isPAss
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off)),
                          prefixIcon: Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextField(
                      controller: cpassword,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Checkbox(
                          // checkColor: Colors.white,
                          // focusColor: Colors.amber,

                          // fillColor: MaterialStateProperty.all(Colors.amber),
                          value: mark,
                          onChanged: (value) {
                            setState(() {
                              mark = !mark;
                            });
                          }),
                      RichText(
                          text: TextSpan(
                              text: "I agree to all the ",
                              style: TextStyle(color: Colors.black),
                              children: [
                            TextSpan(
                                text: "Terms & conditions",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ]))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (mark) {
                        if (cpassword.text == password.text) {
                          signUp();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'pasword and confirm password are  not same')));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Mark the Check box')));
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      // width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: mark
                              ? Color.fromARGB(255, 250, 146, 48)
                              : Colors.grey),
                      child: isLoading
                          ? CircularProgressIndicator()
                          : Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 165,
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      CircleAvatar(
                        // radius: 10,
                        backgroundColor: Colors.white,
                        child: Text("or"),
                      ),
                      SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/7123025_logo_google_g_icon-removebg-preview.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/Apple-Logo-removebg-preview.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/facebooklogo.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
