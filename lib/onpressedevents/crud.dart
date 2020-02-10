//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
class CRUD {

  // static Future<String> getImageUrl(String phone) async {
  //   final DocumentReference doc = Firestore.instance
  //       .collection('/owner/$phone/ownerDetails')
  //       .document('$phone');
  //       doc.get()
  // }

  static addOffineCustomer(String name,String phoneNo,int otp) async {
    try{final _phone = await AuthCheck.getPhone();
    final DocumentReference _doc = Firestore.instance
    .collection('/owner/$_phone/myOrders').document(phoneNo);
    Firestore.instance.runTransaction((transaction) async{
      await transaction.set(_doc, {
        'customerName' : name,
        'customerPhone' : phoneNo,
        'noOfBags' : 1,
        'acceptStatus' :true,
        'photoUrl' : "https://firebasestorage.googleapis.com/v0/b/seguraforowner.appspot.com/o/user-1633249_640.png?alt=media&token=78e04f09-77a5-4556-b833-d73c1904ea2c",
        'isDone' : false,
        'isPremium' : false,
        'otp' : otp,
        });
    }) ;}
    catch(e) {
      Fluttertoast.showToast(msg: "Error adding Customer");
    }
  }

    //   await _doc.get().then((snapshot) {
    //   if (snapshot.exists) {
    //     int otp = snapshot.data['otp'];
    //     if(otp == otp2) 
    //     return true;
    //   }
    // }

  static Future<bool> checkOTP(String customerPhone,int otp2) async {
    bool ret = false;
    final _phone = await AuthCheck.getPhone();
     final DocumentReference _doc = Firestore.instance
    .collection('/owner/$_phone/myOrders').document(customerPhone);
    await _doc.get().then((snapshot){
      if(snapshot.exists) {
        int otp = snapshot.data['otp'];
        if(otp == otp2) {
          ret = true;
        }
      }
    });
    return ret;
  }
 
  static void setProfile(String name, String city, String business,
      String shop, String imageURL, String email) async {
    final phone = await AuthCheck.getPhone();
    final DocumentReference doc = Firestore.instance
        .collection('/owner/$phone/ownerDetails')
        .document('$phone');
    doc.setData({
      'name': name,
      'city': city,
      'shop': shop,
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
        .timeout(Duration(seconds: 6))
        .whenComplete(() {
          print("data updated");
        })
        .catchError((e) {
          print(e);
        });
  }

  static void updateOrder(String phone) async {
    final myphone = await AuthCheck.getPhone();
    final DocumentReference doc = Firestore.instance
        .collection('/owner/$myphone/myOrders')
        .document('$phone');
        doc.updateData({'isDone' : true}).catchError((e){Fluttertoast.showToast(msg : e.code.toString());}).whenComplete((){Fluttertoast.showToast(msg : "Order Completed Successfully"
        );});
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

  static Future uploadImage() async {
    File _image;
        await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((image) {
          _image =image;
    });
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('tests/${Path.basename(_image.path)}}');
    //.child('manager/${widget.user.phoneNumber}/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    Fluttertoast.showToast(msg: "Image Uploaded");
    storageReference.getDownloadURL().then((fileURL) {
      CRUD.updateImageUrl(fileURL);
    }).catchError((e){
      try{Fluttertoast.showToast(msg: e.code);} catch(e){Fluttertoast.showToast(msg : "Error");}
    });
  }

  static Future<String> getImageOnEditScreen() async {
    String _url = '';
        File _image;
        await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((image) {
          _image =image;
    });
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('tests/${Path.basename(_image.path)}}');
        StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    Fluttertoast.showToast(msg: "Image Uploaded");
    await storageReference.getDownloadURL().then((url) {
      _url =url;
    }).catchError((e){return '';});
    return _url;
  }
    static Future<String> getUploadedImageUrl() async {
    String imageUrl = '';
   try {final phone = await AuthCheck.getPhone();
    final DocumentReference doc = Firestore.instance
        .collection('/owner/$phone/ownerDetails')
        .document('$phone');
    await doc.get().then((snapshot) {
      if (snapshot.exists) {
        imageUrl = snapshot.data['imageURL'];
      }
    }).catchError((e) {
      print(e);
      print("Error Corred");
    });}
    catch (e) {
      Fluttertoast.showToast(msg: "Error Handling Image");
    }
    return imageUrl;
  }

  static void updateCapacity(int newCapacity) async{
     final phone = await AuthCheck.getPhone();
    final DocumentReference doc = Firestore.instance
        .collection('/owner/$phone/ownerDetails')
        .document('$phone');
    doc
        .updateData({
          'capacity' : newCapacity
        })
        .timeout(Duration(seconds: 5))
        .whenComplete(() {
          print("Capacity updated");
        })
        .catchError((e) {
          print(e);
          Fluttertoast.showToast(msg: "Network Error");
        }).whenComplete((){print('object');});
  }
}



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