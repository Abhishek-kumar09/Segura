import 'package:flutter/material.dart';
import 'package:segura_manegerial/Main%20Page/main_page.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';
import 'package:segura_manegerial/phone_auth_myVs/homepage.dart';
import 'package:segura_manegerial/phone_auth_myVs/phone_auth.dart';


void main() {
  void mainFunction() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool islogged = await AuthCheck.isLogged();
  String phone = islogged ? await AuthCheck.getPhone() : '';
  print(islogged);
  runApp(MyApp(
    initialRoute: islogged ? '/' : '/loginScreen',
    phone: phone,
  ));
  }
  mainFunction();
}


class MyApp extends StatelessWidget {
  MyApp({@required this.initialRoute, this.phone});
  final String initialRoute;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Auth',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.blue[100],
          errorColor: Colors.red,
          primaryColor: Colors.black,
          accentColor: Colors.blue[900]),
      initialRoute: initialRoute,
      routes: {
        '/': (context) => MainPage(phone: phone),
       '/homepage': (BuildContext context) => MyHome(),

        // '/e': (context) => EditProfile(),
        '/loginScreen': (context) => PhoneAuth()
      },
    );
  }
}
