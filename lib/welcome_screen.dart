import 'package:flutter/material.dart';
import 'colors_and_constatnts.dart';

class WelcomeScreen extends StatefulWidget {
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
          Container(
            child: Image.asset('assets/seguraWithText.jpeg'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
            child: Material(
              elevation: 5.0,
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () {
                  //Go to login screen.
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Log In',
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
              child: MaterialButton(
                onPressed: () {
                  //Go to registration screen.
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Register',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}