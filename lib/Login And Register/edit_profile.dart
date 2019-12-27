import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cache_image/cache_image.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Functions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:segura_manegerial/Main%20Page/main_page.dart';
import 'package:segura_manegerial/onpressedevents/crud.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';

class EditProfile extends StatelessWidget {
  EditProfile({@required this.googleSignInAccount,@required this.user});
  final GoogleSignInAccount googleSignInAccount;
  final FirebaseUser user;
  String name, city, business, alternateNo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 70),
            Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: CircleAvatar(
                        minRadius: 30,
                        maxRadius: 60,
                        backgroundImage: CacheImage(
                           'gs://seguraforowner.appspot.com/pic2.jpg'))),
                Padding(
                  padding: EdgeInsets.fromLTRB(200, 80, 0, 0),
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.edit, color: Colors.white70),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.0),
            TextFormField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration: buildRegisterInputDecoration('Name')),
            SizedBox(height: 8.0),
            TextFormField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  business = value;
                },
                decoration: buildRegisterInputDecoration('Business')),
            SizedBox(height: 8.0),
            TextFormField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  city = value;
                },
                decoration: buildRegisterInputDecoration('City')),
            SizedBox(height: 8.0),
            TextFormField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  alternateNo = value;
                },
                decoration:
                    buildRegisterInputDecoration('Alternate Contact No.')),
            SizedBox(height: 24.0),
            MaterialButton(
              color: Colors.blue[900],
              child: Text('Go'),
              elevation: 10,
              splashColor: Colors.blue,
              onPressed: () async{
                if(name == null || name == '' || city == null || city == '' || business == null || business == '' || alternateNo == null || alternateNo == '' || alternateNo.length != 10) {
                  Alert(context: context, title: "Segura Says", desc: "Please Fill the Form Correctly",type: AlertType.warning,style: AlertStyle(backgroundColor: Colors.white)).show();
                }
                else {
                  CRUD.setProfile(name, city, business, alternateNo, 'imageURL',googleSignInAccount.email);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    MainPage(phone: user.phoneNumber)), (Route<dynamic> route) => false);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
