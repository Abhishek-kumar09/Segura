import 'package:flutter/material.dart';

// import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/detailgrab.dart';
import 'package:segura_manegerial/Login%20And%20Register/registration_screen.dart';
import 'Welcome Page/welcome_screen.dart';
import 'Login And Register/loginScreen.dart';
import 'package:segura_manegerial/ManagerPage/manager.dart';
// import 'Custom Function And Widgets/detailgrab.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Manager.id : (context) => Manager()

      },
    );
  }
}
