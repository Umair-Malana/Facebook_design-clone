import 'package:fbs/screens/login_screen.dart';
import 'package:fbs/todo%20App/log_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController gmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  bool obsecure = true;
  bool load = false;
  bool obs = true;

  FirebaseAuth authenticate = FirebaseAuth.instance;

  Future<void> account() async {
    try {
      setState(() {
        load = true;
      });

      var theuser = await authenticate
          .createUserWithEmailAndPassword(
              email: gmail.text, password: password.text)
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Account created successfully"))));

      setState(() {
        load = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LogScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error in sign up$e")));
      debugPrint("Error in sign up$e");
      setState(() {
        load = false;
      });
    } finally {
      setState(() {
        load = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bgrnd1.jpg"),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              // alignment: Alignment.topLeft,
              height: 650,
              width: 340,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome ,\nSign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                    controller: username,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      // error: ,
                      hintText: "User Name",

                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: gmail,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      // error: ,
                      hintText: "Enter your email",

                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: obsecure,
                    controller: password,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                        icon: Icon(
                          obsecure
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye_rounded,
                          color: Colors.white,
                        ),
                      ),
                      // error: ,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: obs,
                    controller: cpassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obs = !obs;
                          });
                        },
                        icon: Icon(
                          obs
                              ? Icons.remove_red_eye_outlined
                              : Icons.remove_red_eye_rounded,
                          color: Colors.white,
                        ),
                      ),
                      // error: ,
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              // foregroundColor: Colors.red,
                              fixedSize: Size(150, 30)),
                          onPressed: () {
                            if (password.text == cpassword.text) {
                              account();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Please check your cridentials")));
                            }
                          },
                          child: load
                              ? CircularProgressIndicator()
                              : Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                      // TextButton(
                      //     onPressed: () {},
                      //     child: Text(
                      //       "Forget Password?",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 15),
                      //     ))
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Already have an Account?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogScreen()));
                              },
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
