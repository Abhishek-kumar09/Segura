import 'package:flutter/material.dart';
import '../Constants And Colors/colors_and_constatnts.dart';

String hint;

InputDecoration inputDecoration = InputDecoration(
  hintText: hint,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 3.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
