import 'package:flutter/material.dart';
import '../Constants And Colors/colors_and_constatnts.dart';
import '../Login And Register/registration_screen.dart';
import '../Custom Function And Widgets/Widgets.dart';

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
          RoundedButton(
            logo: 'login',
            text: 'Login',
            colour: Colors.lightBlueAccent,
            onpressed: () {
             //TODO:
            },
          ),
          RoundedButton(
              logo: 'register',
              text: 'Register',
              colour: Colors.blueAccent,
              onpressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              }),
        ],
      ),
    );
  }
}
