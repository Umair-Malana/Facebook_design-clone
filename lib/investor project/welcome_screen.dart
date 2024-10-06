import 'package:fbs/screens/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to The Blackbridge Club'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Include the club's logo prominently at the top
            Image.asset("assets/images/logoinvestclub.ico"),
            SizedBox(height: 20),
            // Highlight the exclusive benefits of membership using concise bullet points
            Text(
              'Exclusive Benefits:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            // List of exclusive benefits using concise bullet points
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• Above market returns'),
                Text('• Access to opportunities prior to launch'),
                Text(
                    '• Investment starts as a Pledge, no need to transfer funds'),
                Text('• All live investments receive bonus enhancements'),
                Text('• New avenues for growth and prosperity'),
              ],
            ),
            SizedBox(height: 20),
            // "Join Now" button leading to the Membership Application Form
            ElevatedButton(
              onPressed: () {
                // Navigate to the Membership Application Form screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Join Now'),
            ),
          ],
        ),
      ),
    );
  }
}
