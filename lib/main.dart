import 'package:flutter/material.dart';
import 'package:note_taking_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'note Taking App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
