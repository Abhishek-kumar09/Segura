// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:segura_manegerial/Main%20Page/main_page.dart';
import 'package:segura_manegerial/ManagerPage/animationPrac.dart';
import 'package:segura_manegerial/ManagerPage/manager.dart';
import 'package:segura_manegerial/phone_and_googlesignIn/routes/auth.dart';
// import 'package:segura_manegerial/phone_and_googlesignIn/routes/auth.dart';
// import 'package:segura_manegerial/phone_and_googlesignIn/routes/main_screen.dart';
// import 'package:segura_manegerial/services/phone_auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Auth',

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blue[100],
        primaryColor: Colors.blueGrey[600],
        accentColor: Colors.deepOrange[200],
      ),
      home: MainPage(),

    );
  }
}
