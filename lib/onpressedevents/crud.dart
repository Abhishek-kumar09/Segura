//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUD {
  final DocumentReference doc = Firestore.instance
      .collection('/owner/+919354472907/ownerDetails')
      .document('+919354472907');
  void add() {
    doc.setData({
      'name': 'Priyanshu',
      'city': 'Delhi',
      'earning': 10,
      'phone': '+917048940630',
      'business': 'Mauj'
    }).whenComplete(() {
      print("document added");
    }).catchError((onError) {
      print(onError);
    });
  }

  void updateProfile(String name, String city, String business, String shop) {
    doc
        .updateData({
          'name': name,
          'city': city,
          'business': business,
          'shop': shop,
        })
        .timeout(Duration(seconds: 5))
        .whenComplete(() {
          print("data updated");
        })
        .catchError((e) {
          print(e);
        });
  }

  void delete() {
    doc.delete().whenComplete(() {
      print('document deleted !');
    });
  }
}
