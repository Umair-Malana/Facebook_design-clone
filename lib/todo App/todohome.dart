import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbs/todo%20App/model.dart';
import 'package:flutter/material.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  FirebaseFirestore data = FirebaseFirestore.instance;
  bool circle = false;
  String todoCollection = 'todo data';
  Future<void> addData({String? task, String? process}) async {
    try {
      setState(() {
        circle = true;
      });
      var getdata = await data
          .collection(todoCollection)
          .doc()
          .set({"titl": task, "descript": process}).then((value) =>
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Data added successfully"))));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("error in adding task$e")));

      setState(() {
        circle = false;
      });
    } finally {
      setState(() {
        circle = false;
      });
    }
  }

  List todo = [];
  bool process = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Todo"),

        centerTitle: true,
        // actions: [
        //   IconButton(onPressed: (){}, icon: icon)
        // ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.cyanAccent,
        shadowColor: Colors.black,
        // width: 300,
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 100,
                  ),
                  Positioned(
                    bottom: 18,
                    right: 45,
                    child: Text(
                      "Profile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.cyanAccent,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                  hintText: 'Tittle',
                  label: Text('Tittle'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: desc,
              decoration: InputDecoration(
                  hintText: 'Description',
                  label: Text('Description'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (title.text.isEmpty || desc.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Please give both tittle and description")));
                    } else {
                      addData(task: title.text, process: desc.text);
                      // todo.add(TodoModel(
                      //     tittle: title.text, description: desc.text));
                    }
                    title.clear();
                    desc.clear();
                  });
                },
                child: circle ? CircularProgressIndicator() : Text("Add Task")),
            SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: getTask(),
              builder: (context, snapshot) {
                var snapdata = snapshot.data!.docs;

                if (ConnectionState.waiting == snapshot.connectionState) {
                  return CircularProgressIndicator.adaptive();
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapdata.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text("${snapdata[index]['titl']}"),
                                    Text("${snapdata[index]['descript']}")
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  );
                } else if (!snapshot.hasData) {
                  return Text('No data found');
                } else {
                  return Text('Error in Loading');
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getTask() {
    return data.collection(todoCollection).snapshots();
  }
}
