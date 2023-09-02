// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:note_taking_app/styles/app_style.dart';
// import 'package:note_taking_app/widgets/footer.dart';

// class NoteEditorScreen extends StatefulWidget {
//   const NoteEditorScreen({super.key});

//   @override
//   State<NoteEditorScreen> createState() => _NoteEditorScreenState();
// }

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_taking_app/styles/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateFormat.jm().format(DateTime.now());
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  List<String> redoHistory = [];
  List<String> history = [];

  void _showBottomSheet_01(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppStyle.sideColor,
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //--------Take photo----------
              ListTile(
                leading: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
                title: Text(
                  'Take Photo',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //--------Add image-----------
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: Colors.white,
                ),
                title: Text('Add image',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //--------Drawing--------------
              ListTile(
                leading: Icon(
                  Icons.brush,
                  color: Colors.white,
                ),
                title: Text('Drawing',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //-------Recording------------
              ListTile(
                leading: Icon(
                  Icons.mic_outlined,
                  color: Colors.white,
                ),
                title: Text('Recording',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //--------Checkboxes----------
              ListTile(
                leading: Icon(
                  Icons.check_box_outlined,
                  color: Colors.white,
                ),
                title: Text('Checkboxes',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBottomSheet_02(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppStyle.sideColor,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(32.0),
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-----color-----------
              const Text(
                "Color",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // Ensure the Row doesn't expand horizontally
                  children: List.generate(AppStyle.cardsColor.length, (index) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppStyle.cardsColor[index],
                        shape: CircleBorder(),
                      ),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //------background-----------
              const Text(
                "Background",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize
                      .min, // Ensure the Row doesn't expand horizontally
                  children: List.generate(AppStyle.cardsColor.length, (index) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppStyle.cardsColor[index],
                        shape: CircleBorder(),
                      ),
                      child: SizedBox(
                        height: 40,
                        width: 40,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBottomSheet_03(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppStyle.sideColor,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //--------Delete----------
              ListTile(
                  leading: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                  title: const Text('Delete',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onTap: () {
                    // Adding the note to the trash
                    FirebaseFirestore.instance.collection("Trash").add({
                      "note_title": _titleController.text,
                      "creation_date": date,
                      "note_content": _mainController.text,
                      "color_id": color_id,
                    }).then((DocumentReference docRef) {
                      print("Document ID: ${docRef.id}");

                      // Deleting the document after it has been successfully added
                      FirebaseFirestore.instance
                          .collection("Notes")
                          .doc(docRef.id) // Use the ID obtained from docRef
                          .delete()
                          .then((_) {
                        print("Document successfully deleted!");
                      }).catchError((error) {
                        print("Failed to delete document: $error");
                      });

                      Navigator.pop(context);
                      Navigator.pop(context);
                    }).catchError((error) {
                      print("Failed to add document to Trash: $error");
                    });
                  }),

              //--------Make a copy-----------
              ListTile(
                leading: Icon(
                  Icons.copy,
                  color: Colors.white,
                ),
                title: Text('Make a copy',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  if (_mainController.text.isEmpty) {
                    Navigator.pop(context);
                  } else {
                    String date = DateFormat.jm().format(DateTime.now());
                    FirebaseFirestore.instance.collection("Notes").add({
                      "note_title": _titleController.text,
                      "creation_date": date,
                      "note_content": _mainController.text,
                      "color_id": color_id,
                    }).then((value) {
                      print(value.id);
                      Navigator.pop(context);
                    }).catchError((error) =>
                        print("Failed to add new Note due to $error"));

                    FirebaseFirestore.instance.collection("Notes").add({
                      "note_title": _titleController.text,
                      "creation_date": date,
                      "note_content": _mainController.text,
                      "color_id": color_id,
                    }).then((value) {
                      print(value.id);
                      Navigator.pop(context);
                    }).catchError((error) =>
                        print("Failed to add new Note due to $error"));
                  }
                },
              ),

              //--------Send--------------
              ListTile(
                leading: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                title: const Text('Send',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //-------Collaborator------------
              ListTile(
                leading: const Icon(
                  Icons.person_add_alt,
                  color: Colors.white,
                ),
                title: const Text('Collaborator',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //--------Labels----------
              ListTile(
                leading: const Icon(
                  Icons.label_outline,
                  color: Colors.white,
                ),
                title: const Text('Labels',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //-----Helps & feedback----
              ListTile(
                leading: const Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
                title: const Text('Help & feedback',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _undo() {
    if (history.isNotEmpty) {
      setState(() {
        redoHistory.add(_mainController.text);
        _mainController.text = history.removeLast();
      });
    }
  }

  void _redo() {
    if (redoHistory.isNotEmpty) {
      setState(() {
        history.add(_mainController.text);
        _mainController.text = redoHistory.removeLast();
      });
    }
  }

  void _updateHistory(String text) {
    setState(() {
      history.add(text);
      redoHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () async {
              if (_mainController.text.isEmpty) {
                Navigator.pop(context);
              } else {
                String date = DateFormat.jm().format(DateTime.now());
                FirebaseFirestore.instance.collection("Notes").add({
                  "note_title": _titleController.text,
                  "creation_date": date,
                  "note_content": _mainController.text,
                  "color_id": color_id,
                }).then((value) {
                  print(value.id);
                  Navigator.pop(context);
                }).catchError(
                    (error) => print("Failed to add new Note due to $error"));
              }
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.push_pin_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.archive_outlined),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8.0,
            ),

            //-------------Title----------------
            ListTile(
              title: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 26,
                ),
              ),
            ),

            // ------------List Items----------
            ListTile(
              title: TextField(
                controller: _mainController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Note",
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                ),
                onChanged: (value) {
                  _updateHistory(value);
                },
              ),
            )
          ],
        ),
      ),

      //--------footer-------------
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                _showBottomSheet_01(context);
              },
              icon: const Icon(
                Icons.add_box_outlined,
              ),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                _showBottomSheet_02(context);
              },
              icon: const Icon(
                Icons.palette_outlined,
              ),
              color: Colors.white,
            ),
            _mainController.text.isEmpty
                ? Text(
                    "Edited $date",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                : Row(
                    children: [
                      IconButton(
                        onPressed: _undo,
                        icon: const Icon(Icons.undo),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: _redo,
                        icon: const Icon(Icons.redo),
                        color: Colors.white,
                      ),
                    ],
                  ),
            IconButton(
              onPressed: () {
                _showBottomSheet_03(context);
              },
              icon: const Icon(
                Icons.more_vert,
              ),
              color: Colors.white,
            ),
          ],
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.bottomStart,
    );
  }
}
