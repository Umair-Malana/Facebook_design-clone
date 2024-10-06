// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   var imagepath;
//   // FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
//   FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   getimage() async {
//     // var image = ImagePicker();
//     // var getimage = await image.pickImage(source: ImageSource.camera);
//     if (getimage != null) {
//       setState(() {
//         // imagepath = File(getimage.path);
//       });
//     } else {
//       print("image is not pic");
//     }
//   }

//   getfirebaseImage() async {
//     var image = await _firebaseFirestore.collection('images').get();
//   }

//   Future<void> uploadpost(image) async {
//     try {
//       var addimage = await _firebaseFirestore
//           .collection("images")
//           .doc()
//           .set({"images": image});
//     } catch (e) {
//       print(e);
//     }
//   }

//   // Future<String> getImageUrl(File image) async {
//     var uniquepath = DateTime.fromMillisecondsSinceEpoch.toString();
//     // var refernce = _firebaseStorage.ref().child('images/$uniquepath/');
//     // UploadTask uploadTask = refernce.putFile(image);
//     // TaskSnapshot taskSnapshot = await uploadTask;

//     // String imageUrl = await taskSnapshot.ref.getDownloadURL();
//     // return imageUrl;
//   }

//   addUploadImage(imagepath) async {
//     String uploadimage = await getImageUrl(imagepath);
//     uploadpost(uploadimage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 height: 300,
//                 width: 200,
//                 color: imagepath == null ? Colors.red : Colors.transparent,
//                 child: imagepath == null
//                     ? Text("Pick an Image")
//                     : Image.file(imagepath),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   getimage();
//                 },
//                 child: Text("Pic image"),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     addUploadImage(imagepath);
//                   },
//                   child: Text("Upload an image")),
//               FutureBuilder(
//                 future: _firebaseFirestore.collection('images').get(),
//                 builder: (context, snapshot) {
//                   var snapdata = snapshot.data!.docs;
//                   return SizedBox(
//                     height: 400,
//                     child: ListView.builder(
//                       itemCount: snapdata.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           leading: CircleAvatar(
//                             radius: 40,
//                             backgroundImage:
//                                 NetworkImage('${snapdata[index]['images']}'),
//                           ),
//                           title: Text('Mr Umair'),
//                           subtitle: Text('Hey whats up'),
//                         );
//                       },
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // import 'dart:io';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   var imagepath;
// //   FirebaseStorage firebaseStorage = FirebaseStorage.instance;
// //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
// //   getImage() async {
// //     var image = ImagePicker();

// //     var getImage = await image.pickImage(source: ImageSource.camera);
// //     if (getImage != null) {
// //       setState(() {
// //         imagepath = File(getImage.path);
// //       });
// //     } else {
// //       print('image is not pick');
// //     }
// //   }

// //   Future<void> uploadpost(image) async {
// //     try {
// //       var addimage = await firebaseFirestore
// //           .collection('Images')
// //           .doc()
// //           .set({'images': image});
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   Future<String> getImageUrl(File Image) async {
// //     var uniquepath = DateTime.fromMillisecondsSinceEpoch.toString();
// //     var refernce = firebaseStorage.ref().child('images/$uniquepath/');
// //     UploadTask uploadTask = refernce.putFile(Image);
// //     TaskSnapshot taskSnapshot = await uploadTask;

// //     String imageUrl = await taskSnapshot.ref.getDownloadURL();
// //     return imageUrl;
// //   }

// //   addandUploadImage(image) async {
// //     String uploadImage = await getImageUrl(image);

// //     uploadpost(uploadImage);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Image'),
// //       ),
// //       body: Column(
// //         children: [
// //           Container(
// //             height: 200,
// //             width: 250,
// //             color: imagepath == null ? Colors.red : Colors.transparent,
// //             child: imagepath == null
// //                 ? Text('No Image Found')
// //                 : Image.file(imagepath),
// //           ),
// //           ElevatedButton(
// //               onPressed: () {
// //                 getImage();
// //               },
// //               child: Text('Pick Iamge')),
// //           ElevatedButton(
// //               onPressed: () {
// //                 addandUploadImage(imagepath);
// //               },
// //               child: Text('upload Iamge')),
// //         ],
// //       ),
// //     );
// //   }
// // }