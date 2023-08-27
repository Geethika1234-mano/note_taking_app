import 'package:flutter/material.dart';
import 'package:note_taking_app/styles/app_style.dart';
import 'package:note_taking_app/widgets/sidebar.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({super.key});

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
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
            "Archive",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.grid_view),
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        drawer: SideBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Your archived notes appear here",
                style: TextStyle(
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
