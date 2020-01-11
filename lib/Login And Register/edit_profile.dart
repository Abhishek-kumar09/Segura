import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Functions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Widgets.dart';
import 'package:segura_manegerial/Main%20Page/main_page.dart';
import 'package:segura_manegerial/onpressedevents/crud.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EditProfile extends StatefulWidget {
  EditProfile({@required this.user});
  //  EditProfile({@required this.googleSignInAccount,@required this.user});
  // final GoogleSignInAccount googleSignInAccount;
  final FirebaseUser user;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String name, city, business, alternateNo;
  String photoUrl ='';

  // void getImageUrl() async {
  //   _uploadedImageUrl = await CRUD.getUploadedImageUrl();
  //   setState(() {
      
  //   });
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   getImageUrl();
  // }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async  {
        Fluttertoast.showToast(msg: "Complete the Profile");
        return false;
        },
          child: Scaffold(
        backgroundColor: Color(0xffF6F7F9),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10),
              Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Material(
                          color: Colors.black,                          
                          borderRadius: BorderRadius.circular(90),
                          child: (photoUrl != '')
                              ? CachedNetworkImage(
                                  imageUrl: photoUrl,
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: 140,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.white10, BlendMode.color)),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(backgroundColor: Colors.white,),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                )
                              : CircleAvatar(
                                backgroundImage: AssetImage('assets/defaultUser.png'),
                                minRadius: 70,
                                maxRadius: 70,
                              ))),
                  Padding(
                    padding: EdgeInsets.fromLTRB(200, 80, 0, 0),
                    child: FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.edit, color: Colors.white70),
                      onPressed: () async {
                        print('uploading Image...');
                        photoUrl = await CRUD.getImageOnEditScreen();
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80.0),
              TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: buildRegisterInputDecoration('Name')),
              SizedBox(height: 12.0),
              TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    business = value;
                  },
                  decoration: buildRegisterInputDecoration('Business')),
              SizedBox(height: 12.0),
              TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    city = value;
                  },
                  decoration: buildRegisterInputDecoration('City')),
              SizedBox(height: 12.0),
              TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    alternateNo = value;
                  },
                  decoration:
                      buildRegisterInputDecoration('Name of Shop or Hotel')),
              SizedBox(height: 48.0),
              RoundedButton(
                colour: Colors.blue,
                text: "Save Details",
                onpressed: () async {
                    if (name == null ||
                        name == '' ||
                        city == null ||
                        city == '' ||
                        business == null ||
                        business == '' ||
                        alternateNo == null ||
                        alternateNo == '') {
                      Alert(
                              context: context,
                              title: "Segura Says",
                              desc: "Please Fill the Form Correctly",
                              type: AlertType.warning,
                              style: AlertStyle(backgroundColor: Colors.white))
                          .show();
                    } else {
                      CRUD.setProfile(name, city, business, alternateNo, photoUrl,
                          'user.email');
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainPage(phone: widget.user.phoneNumber)),
                          (Route<dynamic> route) => false);
                    }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
