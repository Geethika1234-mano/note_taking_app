// import 'package:flutter/material.dart';
// import 'package:note_taking_app/screens/home_page.dart';
// import 'package:note_taking_app/screens/sidebar_pages/archive.dart';
// import 'package:note_taking_app/screens/sidebar_pages/help.dart';
// import 'package:note_taking_app/screens/sidebar_pages/newlabel.dart';
// import 'package:note_taking_app/screens/sidebar_pages/reminders.dart';
// import 'package:note_taking_app/screens/sidebar_pages/settings.dart';
// import 'package:note_taking_app/screens/sidebar_pages/trash.dart';
// import 'package:note_taking_app/styles/app_style.dart';

// class SideBar extends StatefulWidget {
//   const SideBar({super.key});

//   @override
//   State<SideBar> createState() => _SideBarState();
// }

// class _SideBarState extends State<SideBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Drawer(
//         backgroundColor: AppStyle.sideColor,
//         child: SafeArea(
//           child: Container(
//             padding: const EdgeInsets.all(18.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Google Keep",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 18.0,
//                 ),
//                 ListTile(
//                   minLeadingWidth: 1,
//                   contentPadding: EdgeInsets.all(0.0),
//                   title: Text(
//                     "Notes",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   leading: Icon(
//                     Icons.lightbulb_outlined,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HomePage()),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   minLeadingWidth: 1,
//                   contentPadding: EdgeInsets.all(0.0),
//                   title: Text(
//                     "Reminders",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   leading: Icon(
//                     Icons.notifications_none_outlined,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Reminders()),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   minLeadingWidth: 1,
//                   contentPadding: EdgeInsets.all(0.0),
//                   title: Text(
//                     "Create new label",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   leading: Icon(
//                     Icons.add,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => NewLabel()),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   minLeadingWidth: 1,
//                   contentPadding: EdgeInsets.all(0.0),
//                   title: Text(
//                     "Archive",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   leading: Icon(
//                     Icons.archive_outlined,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ArchivePage()),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   minLeadingWidth: 1,
//                   contentPadding: EdgeInsets.all(0.0),
//                   title: Text(
//                     "Trash",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   leading: Icon(
//                     Icons.delete_outline,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => TrashPage()),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   minLeadingWidth: 1,
//                   contentPadding: EdgeInsets.all(0.0),
//                   title: Text(
//                     "Settings",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   leading: Icon(
//                     Icons.settings_outlined,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SettingsPage()),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   minLeadingWidth: 1,
//                   contentPadding: EdgeInsets.all(0.0),
//                   title: Text(
//                     "Help & feedback",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   leading: Icon(
//                     Icons.help_outline,
//                     color: Colors.white,
//                     size: 20,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HelpPage()),
//                     );
//                   },
//                 ),
//                 SizedBox(
//                   height: 28.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:note_taking_app/screens/home_page.dart';
import 'package:note_taking_app/screens/sidebar_pages/archive.dart';
import 'package:note_taking_app/screens/sidebar_pages/help.dart';
import 'package:note_taking_app/screens/sidebar_pages/newlabel.dart';
import 'package:note_taking_app/screens/sidebar_pages/reminders.dart';
import 'package:note_taking_app/screens/sidebar_pages/settings.dart';
import 'package:note_taking_app/screens/sidebar_pages/trash.dart';
import 'package:note_taking_app/styles/app_style.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String currentPage = "Notes";

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return "Notes";
      case 1:
        return "Reminders";
      case 2:
        return "Create new label";
      case 3:
        return "Archive";
      case 4:
        return "Trash";
      case 5:
        return "Settings";
      case 6:
        return "Help & feedback";
      default:
        return "";
    }
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.lightbulb_outlined;
      case 1:
        return Icons.notifications_none_outlined;
      case 2:
        return Icons.add;
      case 3:
        return Icons.archive_outlined;
      case 4:
        return Icons.delete_outline;
      case 5:
        return Icons.settings_outlined;
      case 6:
        return Icons.help_outline;
      default:
        return Icons.error;
    }
  }

  void _navigateToPageForIndex(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        setState(() {
          currentPage = "Notes";
        });
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Reminders()),
        );
        setState(() {
          currentPage = "Reminders";
        });
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewLabel()),
        );
        setState(() {
          currentPage = "Create new label";
        });
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArchivePage()),
        );
        setState(() {
          currentPage = "Archive";
        });
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TrashPage()),
        );
        setState(() {
          currentPage = "Trash";
        });
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        setState(() {
          currentPage = "Settings";
        });
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HelpPage()),
        );
        setState(() {
          currentPage = "Help & feedback";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: AppStyle.sideColor,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
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
              SizedBox(height: 18.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minLeadingWidth: 1,
                      contentPadding: EdgeInsets.only(left: 16.0),
                      tileColor: currentPage == _getTitleForIndex(index)
                          ? Color.fromARGB(255, 71, 109, 137)
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      title: Text(
                        _getTitleForIndex(index),
                        style: TextStyle(
                          color: currentPage == _getTitleForIndex(index)
                              ? Color.fromARGB(255, 45, 227, 255)
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      leading: Icon(
                        _getIconForIndex(index),
                        color: currentPage == _getTitleForIndex(index)
                            ? Color.fromARGB(255, 45, 227, 255)
                            : Colors.white,
                        size: 20,
                      ),
                      onTap: () {
                        _navigateToPageForIndex(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
