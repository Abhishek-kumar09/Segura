// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:segura_manegerial/Constants%20And%20Colors/colors_and_constatnts.dart';

import '../Custom Function And Widgets/Widgets.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email,password;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Container(
              child: Image.asset('assets/seguraLight.jpeg'),
              constraints: BoxConstraints(maxHeight: 150),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Bacause your stuff is not just "stuff"',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 48.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.person),
                ),
                hintText: 'Enter your email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextField(
              obscureText: true,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.vpn_key),
                ),
                hintText: 'Enter your password.',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          RoundedButton(
            text: 'Login',
            logo: 'login',
            colour: Colors.lightBlueAccent,
            onpressed: () {
              //After Login
            },
          )
        ],
      ),
    );
  }
}
