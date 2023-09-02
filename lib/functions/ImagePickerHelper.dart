import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_taking_app/styles/app_style.dart';

class ImagePickerHelper {
  static Future<void> showImagePickerDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppStyle.sideColor,
          title: Text(
            "Add image",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                minVerticalPadding: 0,
                minLeadingWidth: 0,
                leading: Icon(
                  Icons.camera_outlined,
                  color: Colors.white,
                ),
                title: Text("Take Photo",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  _takePhoto(context);
                },
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(
                  Icons.image_outlined,
                  color: Colors.white,
                ),
                title:
                    Text("Choose image", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop(); // Close the dialog
                  _pickImage(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> _takePhoto(BuildContext context) async {
    // final imagePicker = ImagePicker();
    // final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    // if (pickedFile != null) {
    //   // _handleCapturedPhoto(context, pickedFile.path);
    //   {}
    // }
    Navigator.pop(context);
  }

  static Future<void> _pickImage(BuildContext context) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Navigator.pop(context);
    }
  }

  static void _handleCapturedPhoto(BuildContext context, String imagePath) {
    // Implement your logic to handle the captured photo here.
    // For example, you can display the image using an Image widget:
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text('Captured Photo')),
          body: Center(
            child: Image.file(
              File(imagePath), // Import 'dart:io' for File class
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}
