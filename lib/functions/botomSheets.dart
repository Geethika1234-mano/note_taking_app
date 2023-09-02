import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_taking_app/styles/app_style.dart';

class BottomSheets {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateFormat.jm().format(DateTime.now());
  TextEditingController titleController = TextEditingController();
  TextEditingController mainController = TextEditingController();
  BottomSheets(
      this.titleController, this.mainController, this.color_id, this.date);

  void showBottomSheet_01(BuildContext context) {
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

  void showBottomSheet_02(BuildContext context) {
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

  void showBottomSheet_03(BuildContext context) {
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
                      "note_title": titleController.text,
                      "creation_date": date,
                      "note_content": mainController.text,
                      "color_id": color_id,
                    }).then((DocumentReference docRef) {
                      print("Document ID: ${docRef.id}");

                      // Deleting the document after it has been successfully added
                      FirebaseFirestore.instance
                          .collection("Trash")
                          .doc(docRef.id) // Use the ID obtained from docRef
                          .delete()
                          .then((_) {
                        print("Document successfully deleted!");
                      }).catchError((error) {
                        print("Failed to delete document: $error");
                      });

                      Navigator.pop(context);
                    }).catchError((error) {
                      print("Failed to add document to Trash: $error");
                    });
                  }),

              //--------Make a copy-----------
              ListTile(
                leading: const Icon(
                  Icons.copy,
                  color: Colors.white,
                ),
                title: const Text('Make a copy',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  if (mainController.text.isEmpty) {
                    Navigator.pop(context);
                  } else {
                    String date = DateFormat.jm().format(DateTime.now());
                    FirebaseFirestore.instance.collection("Notes").add({
                      "note_title": titleController.text,
                      "creation_date": date,
                      "note_content": mainController.text,
                      "color_id": color_id,
                    }).then((value) {
                      print(value.id);
                      Navigator.pop(context);
                    }).catchError((error) =>
                        print("Failed to add new Note due to $error"));

                    FirebaseFirestore.instance.collection("Notes").add({
                      "note_title": titleController.text,
                      "creation_date": date,
                      "note_content": mainController.text,
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
}
