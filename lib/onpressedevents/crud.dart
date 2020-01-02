//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';

class CRUD {
  // void add() async {
  //       final phone =  await AuthCheck.getPhone();
  //  final DocumentReference doc = Firestore.instance
  //     .collection('/owner/$phone/ownerDetails')
  //     .document('$phone');
  //   doc.setData({
  //     'name': 'Priyanshu',
  //     'city': 'Delhi',
  //     'earning': 10,
  //     'phone': '+917048940630',
  //     'business': 'Mauj'
  //   }).whenComplete(() {
  //     print("document added");
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  // }

  static void setProfile(String name, String city, String business,
      String altPhone, String imageURL, String email) async {
    final phone = await AuthCheck.getPhone();
    final DocumentReference doc = Firestore.instance
        .collection('/owner/$phone/ownerDetails')
        .document('$phone');
    doc.setData({
      'name': name,
      'city': city,
      'altphone': altPhone,
      'business': business,
      'imageURL': imageURL,
      'earning': 0,
      'capacity': 10,
      'available': 10,
      'phone': phone,
      'email': email,
      'bagsCollected' : 0
    }).whenComplete(() {
      print("document added");
    }).catchError((onError) {
      print(onError);
    });
  }

  static Future<String> getUploadedImageUrl() async {
    String imageUrl = '';
    final phone = await AuthCheck.getPhone();
    final DocumentReference doc = Firestore.instance
        .collection('/owner/$phone/ownerDetails')
        .document('$phone');
    doc.get().then((snapshot) {
      if (snapshot.exists) {
        imageUrl = snapshot.data['imageURL'];
      }
    }).catchError((e) {
      print(e);
    });
    return imageUrl;
  }

  // static updateImageUrl(String url) {
  //   String phone;
  //   FirebaseAuth.instance.currentUser().then((user){phone = user.phoneNumber;});    
  //   Firestore.instance
  //       .collection('/owner/$phone/ownerDetails')
  //       .document('$phone')
  //       .updateData({'imageURL': url}).whenComplete((){print('Image Uploaded');});
  // }
    static void updateImageUrl(
      String url) async {
    final phone = await AuthCheck.getPhone();
    final DocumentReference doc = Firestore.instance
        .collection('/owner/$phone/ownerDetails')
        .document('$phone');
    doc
        .updateData({
          'imageURL' : url
        })
        .timeout(Duration(seconds: 5))
        .whenComplete(() {
          print("Image updated");
        })
        .catchError((e) {
          print(e);
        });
  }

  void updateProfile(
      String name, String city, String business, String shop) async {
    final phone = await AuthCheck.getPhone();
    final DocumentReference doc = Firestore.instance
        .collection('/owner/$phone/ownerDetails')
        .document('$phone');
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

  void delete() async {
    final phone = await AuthCheck.getPhone();
    final DocumentReference doc = Firestore.instance
        .collection('/owner/$phone/ownerDetails')
        .document('$phone');
    doc.delete().whenComplete(() {
      print('document deleted !');
    });
  }
}
