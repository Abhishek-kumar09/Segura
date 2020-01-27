import 'dart:ui';

import 'package:flutter/material.dart';

const double iconSize = 32;
const Color darkblue = Color(0xFF060233);
const Color golden = Color(0xFFFFD700);
const String homepage = '/homepage';
const String mainScreen = '/';
const String loginScreen = 'loginScreen';
const String editProfile = '/e';

InputDecoration buildLoginInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    icon: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Icon(icon),
    ),
    hintText: hintText,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}

InputDecoration addCustomerdecoration() {
  return InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 5)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ));
}

InputDecoration buildRegisterInputDecoration(String labelText) {
  return InputDecoration(
    labelText: labelText,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}

TextStyle mainTextstyle() =>
    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 24);

TextStyle subTextStyle() => TextStyle(
    color: Colors.blue[900], fontWeight: FontWeight.w600, fontSize: 24);

BoxDecoration boxDecoration() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/t2.jpg'),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight)
    ),
    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
    border: Border.all(color: Colors.blue, style: BorderStyle.solid, width: 2),
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(50), topLeft: Radius.circular(50)),
    color: Colors.white,
  );
}

//  Alert showAlert(BuildContext context, String title, String subText,String firstButtonText,String secondButtonText ) {
//   return Alert(
//               context: context,
//               type: AlertType.warning,
//               title: title,
//               desc: subText,
//               buttons: [
//                 DialogButton(
//                   child: Text(
//                     firstButtonText,
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   onPressed: () => Navigator.pop(context),
//                   color: Colors.lightBlueAccent,
//                 ),
//                 DialogButton(
//                   child: Text(
//                     secondButtonText,
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   onPressed: () => Navigator.pop(context),
//                   gradient: LinearGradient(colors: [
//                     Color.fromRGBO(116, 116, 191, 1.0),
//                     Color.fromRGBO(52, 138, 199, 1.0)
//                   ]),
//                 )
//               ],
//             );
// }
