import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_taking_app/styles/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
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
                    // First, delete the document from the "Notes" collection
                    FirebaseFirestore.instance
                        .collection("Notes")
                        .doc(widget
                            .doc.id) // Use the ID from the widget's document
                        .delete()
                        .then((_) {
                      print("Document successfully deleted from Notes!");
                    }).catchError((error) {
                      print("Failed to delete document from Notes: $error");
                    });

                    // Next, delete the document from the "Pinned" collection
                    FirebaseFirestore.instance
                        .collection("Pinned")
                        .doc(widget
                            .doc.id) // Use the ID from the widget's document
                        .delete()
                        .then((_) {
                      print("Document successfully deleted from Notes!");
                    }).catchError((error) {
                      print("Failed to delete document from Notes: $error");
                    });

                    // Then, delete the document from the "Archive" collection
                    FirebaseFirestore.instance
                        .collection("Archive")
                        .doc(widget
                            .doc.id) // Use the ID from the widget's document
                        .delete()
                        .then((_) {
                      print("Document successfully deleted from Notes!");
                    }).catchError((error) {
                      print("Failed to delete document from Notes: $error");
                    });

// Next, add the document to the "Trash" collection
                    FirebaseFirestore.instance.collection("Trash").add({
                      "note_title": widget.doc["note_title"],
                      "creation_date": widget.doc["creation_date"],
                      "note_content": widget.doc["note_content"],
                      "color_id": widget.doc["color_id"],
                    }).then((DocumentReference docRef) {
                      print("Document ID: ${docRef.id}");
                      Navigator.pop(context);
                    }).catchError((error) {
                      print("Failed to add document to Trash: $error");
                    });
                    Navigator.pop(context);
                    Navigator.pop(context);
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
    int color_id = widget.doc['color_id'];
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.cardsColor[color_id],
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
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseFirestore.instance.collection("Pinned").add({
                  "note_title": _titleController.text,
                  "creation_date": date,
                  "note_content": _mainController.text,
                  "color_id": color_id,
                }).then((value) {
                  print(value.id);
                  Navigator.pop(context);
                }).catchError(
                    (error) => print("Failed to pin Note due to $error"));
              },
              icon: const Icon(Icons.push_pin_outlined, color: Colors.black),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notification_add_outlined,
                  color: Colors.black),
            ),
            IconButton(
              onPressed: () {
                FirebaseFirestore.instance.collection("Archive").add({
                  "note_title": _titleController.text,
                  "creation_date": date,
                  "note_content": _mainController.text,
                  "color_id": color_id,
                }).then((value) {
                  print(value.id);
                  Navigator.pop(context);
                }).catchError(
                    (error) => print("Failed to add new Note due to $error"));
              },
              icon: const Icon(Icons.archive_outlined, color: Colors.black),
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doc["note_title"],
                style: AppStyle.mainTitle,
              ),
              SizedBox(height: 4.0),
              Text(
                widget.doc["creation_date"],
                style: AppStyle.dateTitle,
              ),
              SizedBox(height: 28.0),
              Text(
                widget.doc["note_content"],
                style: AppStyle.mainContent,
              ),
            ],
          ),
        ),
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
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {
                  _showBottomSheet_02(context);
                },
                icon: const Icon(
                  Icons.palette_outlined,
                ),
                color: Colors.black,
              ),
              _mainController.text.isEmpty
                  ? Text(
                      "Edited $date",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    )
                  : Row(
                      children: [
                        IconButton(
                          onPressed: _undo,
                          icon: const Icon(Icons.undo),
                          color: Colors.black,
                        ),
                        IconButton(
                          onPressed: _redo,
                          icon: const Icon(Icons.redo),
                          color: Colors.black,
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
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
