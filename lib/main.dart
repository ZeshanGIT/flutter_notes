import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase/firebase.dart' as WebFirebase;

import 'home/home.dart';

void main() {
  WebFirebase.initializeApp(
    apiKey: "AIzaSyARDm0W6FrnEpniR7hE9VnwiJt1LCMHP3Q",
    authDomain: "flutter-notes-42fa2.firebaseapp.com",
    databaseURL: "https://flutter-notes-42fa2.firebaseio.com",
    projectId: "flutter-notes-42fa2",
    storageBucket: "flutter-notes-42fa2.appspot.com",
    messagingSenderId: "660701553783",
    appId: "1:660701553783:web:3b11008f4f199512fd5272",
    measurementId: "G-4JPD4NY5DN",
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(),
        primaryColor: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => Home(),
      },
    );
  }
}
