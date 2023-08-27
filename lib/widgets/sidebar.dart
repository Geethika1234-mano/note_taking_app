import 'package:flutter/material.dart';
import 'package:note_taking_app/styles/app_style.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: AppStyle.mainColor,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(18.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Google Keep",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                ListTile(
                  minLeadingWidth: 1,
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                    "Notes",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.lightbulb_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: null,
                ),
                ListTile(
                  minLeadingWidth: 1,
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                    "Reminders",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: null,
                ),
                ListTile(
                  minLeadingWidth: 1,
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                    "Create new label",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: null,
                ),
                ListTile(
                  minLeadingWidth: 1,
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                    "Archive",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.archive_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: null,
                ),
                ListTile(
                  minLeadingWidth: 1,
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                    "Trash",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: null,
                ),
                ListTile(
                  minLeadingWidth: 1,
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: null,
                ),
                ListTile(
                  minLeadingWidth: 1,
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                    "Help & feedback",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  leading: Icon(
                    Icons.help_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  onTap: null,
                ),
                SizedBox(
                  height: 28.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
