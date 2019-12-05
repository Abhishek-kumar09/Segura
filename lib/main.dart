import 'package:flutter/material.dart';
import 'package:segura_manegerial/Main%20Page/main_page.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';
import 'package:segura_manegerial/onpressedevents/orderdetail.dart';
import 'package:segura_manegerial/phone_and_googlesignIn/routes/auth.dart';

void main() async {
  AuthCheck _auth = new AuthCheck();
  final bool islogged = await _auth.isLogged();
  final String phone = await _auth.getPhone();
  print(islogged);
  runApp(MyApp(initialRoute: islogged ? '/' : '/loginScreen',phone: phone,));
}

class MyApp extends StatelessWidget {

  MyApp({@required this.initialRoute,this.phone});
  final String initialRoute;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Auth',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blue[100],
        primaryColor: Colors.blueGrey[600],
        accentColor: Colors.deepOrange[200],
      ),
     initialRoute: initialRoute,
      routes: {
        '/' : (context) => MainPage(phone: phone,),
        '/loginScreen' : (context) => AuthScreen()
      },
    );
  }
}
