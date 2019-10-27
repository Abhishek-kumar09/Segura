import 'package:flutter/material.dart';
import 'package:segura_manegerial/Login%20And%20Register/loginScreen.dart';
import '../Constants And Colors/colors_and_constatnts.dart';
import '../Login And Register/registration_screen.dart';
import '../Login And Register/loginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Text(
              "WELCOME TO",
              style: TextStyle(
                  fontSize: 25,
                  color: primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Hero(
            tag: 'logo',
            child: Container(
              child: Image.asset('assets/seguraWithText.jpeg'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
            child: Material(
              elevation: 5.0,
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(30.0),
              child: Hero(
                tag: 'login',
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
              elevation: 5.0,
              child: Hero(
                tag: 'register',
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
