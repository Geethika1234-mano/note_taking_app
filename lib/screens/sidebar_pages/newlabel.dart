import 'package:flutter/material.dart';
import 'package:note_taking_app/styles/app_style.dart';

class NewLabel extends StatefulWidget {
  const NewLabel({super.key});

  @override
  State<NewLabel> createState() => _NewLabelState();
}

class _NewLabelState extends State<NewLabel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0.0,
        title: Text(
          "Edit labels",
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              title: Text(
                "Create new label",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              contentPadding: EdgeInsets.all(0.0),
              leading: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
              trailing: Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
              onTap: null,
            ),
          ],
        ),
      ),
    );
  }
}
