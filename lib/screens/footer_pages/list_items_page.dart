import 'package:flutter/material.dart';
import 'package:note_taking_app/styles/app_style.dart';

class ListItemsPage extends StatefulWidget {
  const ListItemsPage({super.key});

  @override
  State<ListItemsPage> createState() => _ListItemsPageState();
}

class _ListItemsPageState extends State<ListItemsPage> {
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
                leading: Icon(
                  Icons.delete_outline,
                  color: Colors.white,
                ),
                title: Text('Delete',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

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
                  Navigator.pop(context);
                },
              ),

              //--------Send--------------
              ListTile(
                leading: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                title: Text('Send',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //-------Collaborator------------
              ListTile(
                leading: Icon(
                  Icons.person_add_alt,
                  color: Colors.white,
                ),
                title: Text('Collaborator',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //--------Labels----------
              ListTile(
                leading: Icon(
                  Icons.label_outline,
                  color: Colors.white,
                ),
                title: Text('Labels',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              //-----Helps & feedback----
              ListTile(
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
                title: Text('Help & feedback',
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.push_pin_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notification_add_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.archive_outlined),
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.0,
              ),

              //-------------Title----------------
              ListTile(
                title: const TextField(
                  decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.grey),
                    focusColor: Colors.grey,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 26,
                  ),
                ),
                trailing: PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  ),
                  onSelected: (value) {
                    if (value == 'Hide checkboxes') {}
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'Hide checkboxes',
                        child: Text(
                          'Hide checkboxes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ];
                  },
                  color: AppStyle.sideColor,
                ),
              ),

              // ------------List Items----------
              Container()
            ],
          ),
        ),

        //--------footer-------------
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  _showBottomSheet_01(context);
                },
                icon: Icon(
                  Icons.add_box_outlined,
                ),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  _showBottomSheet_02(context);
                },
                icon: Icon(
                  Icons.palette_outlined,
                ),
                color: Colors.white,
              ),
              Text(
                "Edited 3.39 PM",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  _showBottomSheet_03(context);
                },
                icon: Icon(
                  Icons.more_vert,
                ),
                color: Colors.white,
              ),
            ],
          ),
        ],
        persistentFooterAlignment: AlignmentDirectional.bottomStart,
      ),
    );
  }
}
