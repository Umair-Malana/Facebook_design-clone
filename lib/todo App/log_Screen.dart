import 'package:fbs/todo%20App/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  TextEditingController Email = TextEditingController();
  TextEditingController Pass = TextEditingController();
  TextEditingController rPass = TextEditingController();

  FirebaseAuth authuser = FirebaseAuth.instance;
  bool secure = true;
  bool loading = false;

  Future<void> forget() async {
    try {
      setState(() {
        loading = true;
      });

      var frgtpass = await authuser
          .sendPasswordResetEmail(email: rPass.text)
          .then((value) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Code sent successfully"))));

      setState(() {
        loading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      setState(() {
        loading = false;
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> loguser() async {
    try {
      setState(() {
        loading = true;
      });

      var creden = await authuser
          .signInWithEmailAndPassword(email: Email.text, password: Pass.text)
          .then((value) => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Logged in Successfully"))));

      setState(() {
        loading = false;
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignupScreen()));
    } catch (e) {
      print(e);
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
                    "Hello,\nSign in",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 160,
                  ),
                  TextFormField(
                    controller: Email,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person,
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
                    obscureText: secure,
                    controller: Pass,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            secure = !secure;
                          });
                        },
                        icon: Icon(
                          secure
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                      // error: ,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              // foregroundColor: Colors.red,
                              fixedSize: Size(150, 30)),
                          onPressed: () async {
                            if (Email.text.isNotEmpty && Pass.text.isNotEmpty) {
                              loguser();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Please check your credentials")));
                            }
                          },
                          child: loading == true
                              ? CircularProgressIndicator()
                              : Text(
                                  "Sign In",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                      TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.cyanAccent,
                                  content: SizedBox(
                                    height: 150,
                                    child: Column(
                                      children: [
                                        Text("Reset Password"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: rPass,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                            // error: ,
                                            hintText: "Enter your email",

                                            hintStyle:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(),
                                            onPressed: () {
                                              if (rPass.text.isNotEmpty) {
                                                forget();
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            'Enter your email ')));
                                              }
                                            },
                                            child: loading == true
                                                ? CircularProgressIndicator()
                                                : Text("Reset"))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Dont have Account?",
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
                                        builder: (context) => SignupScreen()));
                              },
                              child: Text(
                                "Sign Up",
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
