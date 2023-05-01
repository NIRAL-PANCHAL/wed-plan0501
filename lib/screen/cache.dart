import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class CacheScreen1 extends StatefulWidget {
  const CacheScreen1({Key? key}) : super(key: key);

  @override
  State<CacheScreen1> createState() => _CacheScreen1State();
}

class _CacheScreen1State extends State<CacheScreen1> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getPosts() async {
    return await firestore.collection("users").get();
  }

  Stream<QuerySnapshot> postsStream() {
    return firestore.collection("users").snapshots();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  File? imageFile;
  final imageRef = FirebaseFirestore.instance
      .collection('images')
      .doc('img_id')
      .get();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  String imgUrl = '';

  Future<String?> addCollection() async {
    CollectionReference newCollection =
        FirebaseFirestore.instance.collection('users');
    await newCollection
        .doc('Niral')
        .collection("Panchal")
        .add({
      'name': _controller3,
      'notes': _controller1,
      'number': _controller2,
      'image': imgUrl}).whenComplete(() {
      Navigator.pop(context);
    });
    return 'users';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return const Text('Enter Something');
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot doc) {
              return
                GestureDetector(
                  onDoubleTap: (){
                    setState(() {
                      var collection = FirebaseFirestore.instance
                          .collection('users');
                      collection
                          .doc('${doc.id}') // <-- Doc ID to be deleted.
                          .delete()
                          .then((_) => print('Updated'))
                          .catchError((error) =>
                          print('Update failed: $error'));
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 6, right: 17,top: 5),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(padding: EdgeInsets.all(6)),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  height: 15.w,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child:
                                    Image.file(File(doc['image']))
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 14, right: 14, top: 10),
                              width: 200,
                              height: 53,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    doc["name"],
                                    style: const TextStyle(fontSize: 22),
                                  ),
                                  Text(
                                    doc["notes"],
                                    style:
                                    const TextStyle(fontSize: 18, color: Colors.grey),
                                  ),
                                  Text(doc["number"].toString()),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text("2:45",
                                    style: TextStyle(color: Colors.grey, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 0.4.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                          indent: 2,
                          endIndent: 2,
                        )
                      ],
                    ),
                  ),
                );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: Container(
                      child: Column(children: [
                        TextField(
                          controller: _controller3,
                          decoration: const InputDecoration(hintText: 'Enter Name'),
                        ),
                        TextField(
                            controller: _controller2,
                            decoration: const InputDecoration(
                              hintText: 'Enter Number',
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                            ]),
                        TextField(
                          controller: _controller1,
                          decoration: const InputDecoration(hintText: 'Enter Note'),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: ((builder) => bottomsheet()));
                            },
                            child: Container(
                                width: 300,
                                height: 2.h,
                                color: Colors.black26,
                                child: const Text("Click me to upload photo!"))),
                        SizedBox(
                          height: 4.h,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await users.add({
                                'name': _controller3.text,
                                'number': _controller2.text,
                                'notes': _controller1.text,
                                'image': imgUrl
                              }).then((value) => print("user Added"));
                              Navigator.pop(context);
                            },
                            child: const Text('Submit Data!'))
                      ]),
                    ));
              });
        },
      ),
    );
  }
  Widget bottomsheet() {
    return Container(
      height: 15.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          const Text(
            "Choose Profile photo:",
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                  await imagePicker.pickImage(source: ImageSource.camera);
                  if (file == null) return;
                  String uniqueFileName =
                  DateTime.now().microsecondsSinceEpoch.toString();
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages = referenceRoot.child('images');

                  Reference referenceImageToUpload =
                  referenceDirImages.child(uniqueFileName);
                  referenceImageToUpload.putFile(File(file.path));
                  try {
                    await referenceImageToUpload.putFile(File(file.path));
                    imgUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (error) {}
                },
                child: Container(
                  child: const Icon(Icons.camera, size: 50),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              GestureDetector(
                onTap: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                  await imagePicker.pickImage(source: ImageSource.gallery);
                  if (file == null) return;
                  String uniqueFileName =
                  DateTime.now().microsecondsSinceEpoch.toString();
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages = referenceRoot.child('images');

                  Reference referenceImageToUpload =
                  referenceDirImages.child(uniqueFileName);
                  referenceImageToUpload.putFile(File(file.path));
                  try {
                    await referenceImageToUpload.putFile(File(file.path));
                    imgUrl = await file.path;
                  } catch (error) {}
                },
                child: Container(
                  child: const Icon(Icons.image, size: 50),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
/////
