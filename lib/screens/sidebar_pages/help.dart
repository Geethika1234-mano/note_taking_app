import 'package:flutter/material.dart';
import 'package:note_taking_app/styles/app_style.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.mainColor,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0.0,
          title: Text(
            "Help",
          ),
          backgroundColor: Colors.transparent,
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onSelected: (value) {
                if (value == 'View in Google Play Store') {
                } else if (value == 'Clear help history') {
                } else if (value == 'Version info') {
                } else if (value == 'Privacy Policy') {
                } else if (value == 'Open source licenses') {}
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'View in Google Play Store',
                    child: Text(
                      'View in Google Play Store',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Clear help history',
                    child: Text(
                      'Clear help history',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Version info',
                    child: Text(
                      'Version info',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Privacy Policy',
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Open source licenses',
                    child: Text(
                      'Open source licenses',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ];
              },
              color: AppStyle.sideColor,
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(2),
          height: 450,
          decoration: BoxDecoration(color: Colors.blueGrey.shade900),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "popular help resources",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text(
                  "How to use Google Keep",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.blueGrey.shade900,
                leading: Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Export your data from Google Keep",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.blueGrey.shade900,
                leading: Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Fix problems with Google Keep",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.blueGrey.shade900,
                leading: Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Archive notes & lists",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.blueGrey.shade900,
                leading: Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text(
                  "Create or edit a note",
                  style: TextStyle(color: Colors.white),
                ),
                tileColor: Colors.blueGrey.shade900,
                leading: Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey.shade800,
                ),
                child: ListTile(
                  title: Text(
                    "Search help",
                    style: TextStyle(color: Colors.white),
                  ),
                  tileColor: Colors.blueGrey.shade900,
                  leading: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Send feedback",
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.feedback_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
