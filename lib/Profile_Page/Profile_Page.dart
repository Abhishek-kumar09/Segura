import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Widgets.dart';
import 'package:segura_manegerial/Login%20And%20Register/edit_profile.dart';
import 'package:segura_manegerial/Main%20Page/my_orders.dart';
import 'package:segura_manegerial/Main%20Page/my_profile.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';

String Nami;

class Profile_Page extends StatefulWidget {
  Profile_Page({@required this.phone});
  final String phone;
  @override
  _Profile_PageState createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  FirebaseUser appuser;
  @override
  void getUser() async {
    appuser = await AuthCheck.getUser();
    setState(() {});
  }

  void onSelected(choice) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil(
          loginScreen, (Route<dynamic> route) => false);
      Fluttertoast.showToast(msg: "Signed Out");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error while SignOut");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileBuider(widget.phone, appuser));
  }
}

class ProfileBuider extends StatelessWidget {
  ProfileBuider(this.phoneNumber, this.user);
  final String phoneNumber;
  final FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('/owner/$phoneNumber/ownerDetails')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.pink,
            ));
          }
          final userdetails = snapshot.data.documents;
          if (userdetails.length == 0) {
            return Scaffold(
              body: EditProfile(user: user),
            );
          }
          Nami = 'Harshit';
          Widget myprofile;
          for (var userdetail in userdetails) {
            final name = userdetail.data['name'].toString();
            final business = userdetail.data['business'].toString();
            final photo = userdetail.data['imageURL'];
            final city = userdetail.data['city'];
            final bagCollected = userdetail.data['bagsCollected'];
            final earnings = userdetail.data['earning'];
            final phone = userdetail.data['phone'];
            final email = userdetail.data['email'];
            final shop = userdetail.data['shop'];
            final capacity = userdetail.data['capacity'];
            myprofile = MyProfile(
              name: name,
              photo: photo,
              business: business,
              city: city,
              bagCollected: bagCollected,
              earnings: earnings,
              phone: phone,
              email: email,
              shop: shop,
              capacity: capacity,
            );
          }
          return Scaffold(
            body: myprofile,
          );
          // return CircularProgressIndicator(backgroundColor: Colors.teal,);
        });
  }

