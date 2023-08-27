import 'package:flutter/material.dart';
import 'package:note_taking_app/styles/app_style.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool switchValue = false;
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
          "Settings",
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Display options",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Add new items to bottom",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: Switch(
                value: !switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = !switchValue;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Move checked items to bottom",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: Switch(
                value: !switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Display rich links previews",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: Switch(
                value: !switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Theme",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: Text(
                "System default",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Reminder defaults",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Morning",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: Text(
                "8.00 AM",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Afternoon",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: Text(
                "1.00 PM",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Evening",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: Text(
                "6.00 PM",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Sharing",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Enable sharing",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              trailing: Switch(
                value: !switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
