import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

void main() {
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
