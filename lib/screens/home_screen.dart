// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbs/screens/add_task.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  bool isLoading = false;
  TextEditingController title = TextEditingController();
  TextEditingController pass = TextEditingController();
  deleteTask(String taskid) async {
    var delete = await firebaseFirestore
        .collection('Tasks')
        .doc(taskid)
        .delete()
        .then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Task deleted Successfully')));
      // setState(() {});
    });
  }

  updateTask(String taskId, String title, String desc) async {
    var updateData = firebaseFirestore
        .collection('Tasks')
        .doc(taskId)
        .update({'title': title, 'desc': desc}).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Task Updated Successfully')));
      Navigator.pop(context);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Task'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: firebaseFirestore.collection('Tasks').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // If the connection is still waiting, show a progress indicator.
                return Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                // If there's no data, show a message.
                return Center(child: Text('No data found'));
              } else {
                // If data is available, show it.
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var snapdata = snapshot.data!.docs[index];
                      return ListTile(
                        leading: Icon(Icons.task),
                        title: Text(snapdata['title']),
                        subtitle: Text(snapdata['desc']),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    deleteTask(snapdata.id);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: Column(
                                          children: [
                                            TextField(
                                              controller: title,
                                              decoration: InputDecoration(
                                                  hintText: 'Title',
                                                  label: Text('Title'),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                                width: 300,
                                                height: 50,
                                                child: ElevatedButton(
                                                    onPressed: () async {
                                                      updateTask(
                                                          snapdata.id,
                                                          title.text,
                                                          pass.text);
                                                    },
                                                    child: isLoading
                                                        ? CircularProgressIndicator
                                                            .adaptive()
                                                        : Text('Update Task'))),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
