import 'package:flutter/material.dart';
import 'package:segura_manegerial/Main%20Page/main_page.dart';

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
