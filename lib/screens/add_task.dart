// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbs/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isLoading = false;
  TextEditingController title = TextEditingController();
  TextEditingController pass = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addTask({String? title, String? desc}) async {
    try {
      setState(() {
        isLoading = true;
      });
      var addData = await firebaseFirestore
          .collection('Tasks')
          .doc()
          .set({'title': title, 'desc': desc}).then((value) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Task added Successfully')));
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error in adding task $e')));
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
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: title,
            decoration: InputDecoration(
                hintText: 'Title',
                label: Text('Title'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: pass,
            decoration: InputDecoration(
                hintText: 'Description',
                label: Text('Description'),
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
                    addTask(title: title.text, desc: pass.text);
                  },
                  child: isLoading
                      ? CircularProgressIndicator.adaptive()
                      : Text('Add Task'))),
        ],
      ),
    );
  }
}
