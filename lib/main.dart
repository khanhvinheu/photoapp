import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screen/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
