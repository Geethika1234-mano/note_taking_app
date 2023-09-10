import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_taking_app/screens/note_editor.dart';
import 'package:note_taking_app/screens/note_reader.dart';
import 'package:note_taking_app/styles/app_style.dart';
import 'package:note_taking_app/widgets/footer.dart';
import 'package:note_taking_app/widgets/note_card.dart';
import 'package:note_taking_app/widgets/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSingleItemView = false;
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
          title: const Text(
            "Search your notes",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSingleItemView = !isSingleItemView;
                });
              },
              icon: Icon(isSingleItemView
                  ? Icons.view_agenda_outlined
                  : Icons.grid_view),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle_outlined),
            ),
          ],
          backgroundColor: AppStyle.sideColor,
        ),
        drawer: SideBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              ListTile(
                title: Text(
                  "Pinned",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.push_pin_outlined,
                  color: Colors.white,
                ),
                minLeadingWidth: 0,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Pinned")
                      .snapshots(), // Fetch "Pinned" items here
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> pinnedSnapshot) {
                    // Checking the connection state for "Pinned" items
                    if (pinnedSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (pinnedSnapshot.hasData) {
                      // Display "Pinned" items
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isSingleItemView ? 2 : 1,
                        ),
                        children: pinnedSnapshot.data!.docs
                            .map((note) => noteCard(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NoteReaderScreen(note)));
                                }, note))
                            .toList(),
                      );
                    }

                    return SizedBox.shrink();
                  },
                ),
              ),
              const SizedBox(height: 5.0),
              ListTile(
                title: Text(
                  "Others",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Notes")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    // Checking the connection state, if we still load the data we can display a progress bar
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasData) {
                      // Display "Notes" items
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isSingleItemView ? 2 : 1,
                        ),
                        children: snapshot.data!.docs
                            .map((note) => noteCard(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NoteReaderScreen(note)));
                                }, note))
                            .toList(),
                      );
                    }

                    return Text(
                      "There's no Notes",
                      style: GoogleFonts.nunito(color: Colors.white),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton(
            backgroundColor: AppStyle.sideColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
              side: BorderSide(
                width: 5,
                color: AppStyle.mainColor,
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NoteEditorScreen()));
            },
            child: Icon(
              size: 35,
              Icons.add,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        persistentFooterButtons: [
          FooterButton(),
        ],
      ),
    );
  }
}
