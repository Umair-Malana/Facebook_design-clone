import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbs/firebase_options.dart';
import 'package:fbs/investor%20project/form_screen.dart';
import 'package:fbs/investor%20project/investment_details.dart';
import 'package:fbs/investor%20project/investment_screen.dart';
import 'package:fbs/investor%20project/potential_payments.dart';
import 'package:fbs/investor%20project/welcome_screen.dart';
import 'package:fbs/screens/sign_uppage.dart';
import 'package:fbs/todo%20App/log_Screen.dart';
import 'package:fbs/todo%20App/sign_up.dart';
import 'package:fbs/todo%20App/todohome.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: PotentialInvestmentsScreen(),
    );
  }
}
