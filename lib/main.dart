import 'package:flutter/material.dart';
import 'package:segura_manegerial/detailgrab.dart';
import 'package:segura_manegerial/registration_screen.dart';
import 'welcome_screen.dart';
import 'loginScreen.dart';
import 'detailgrab.dart';
void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      // initialRoute: WelcomeScreen.id,
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
      },
    );
  }
}

