import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
