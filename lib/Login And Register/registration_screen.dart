import 'package:flutter/material.dart';
import 'package:segura_manegerial/onpressedevents/crud.dart';

import '../Custom Function And Widgets/Widgets.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({this.name,this.city,this.business,this.shop});

  final String name;
  final String city;
  final String business;
  final String shop;
  static String id = 'RegistrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String userCity, userShop, firstName, lastName, business;
  CRUD crud = new CRUD();
  bool showSpinner = false;
  //Auth _auth = new Auth();
  String labelBusiness = "Business";
  String labelFirstName = "FirstName";
  String labelCity = "Enter City you have shop in";
  String labelShopName = "Enter Shop Name";
  String photoUrl; //TODO: work on it

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 10,),
                Center(
                    child: CircleAvatar(
                  minRadius: 30,
                  maxRadius: 60,
                  backgroundImage: NetworkImage(
                      'https://cdn.vox-cdn.com/thumbor/wI3iu8sNbFJSQB4yMLsoPMNzIHU=/0x0:3368x3368/1200x800/filters:focal(1188x715:1726x1253)/cdn.vox-cdn.com/uploads/chorus_image/image/62994726/AJ_Finn_author_photo_color_photo_courtesy_of_the_author.0.jpg'),
                )),
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  initialValue: widget.name,
                  onChanged: (value) {
                    setState(() {
                      if (value == "") {
                        labelFirstName = "Enter Your Name";
                      } else {
                        labelFirstName = "";
                      }
                    });
                    value.trim();
                    firstName = (value == null) ? widget.name : value;
                  },
                  decoration: buildRegisterInputDecoration(labelFirstName),
                ),
                
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  initialValue: widget.business,
                  onChanged: (value) {
                    //Do something with the user input.
                    setState(() {
                      if (value == "") {
                        labelBusiness = "Enter Your Business";
                      } else {
                        labelBusiness = "";
                      }
                    });
                    value.trim();
                    business = (value == null) ? widget.business : value;
                  },
                  decoration: buildRegisterInputDecoration(labelBusiness),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  initialValue: widget.city,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      if (value == "") {
                        labelCity = "Enter Your City";
                      } else {
                        labelCity = "";
                      }
                    });
                    value.trim();
                    userCity = (value == null) ? widget.city : value;
                  },
                  decoration: buildRegisterInputDecoration(labelCity),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  initialValue: widget.shop,
                  onChanged: (value) {
                    setState(() {
                      if (value == "") {
                        labelShopName = "Enter Your Shop";
                      } else {
                        labelShopName = "";
                      }
                    });
                    //Do something with the user input.
                    value.trim();
                    userShop = (value == null) ? widget.shop : value;
                  },
                  decoration: buildRegisterInputDecoration(labelShopName),
                ),
                SizedBox(
                  height: 80,
                ),
                RoundedButton(
                    colour: Colors.blue,
                    text: 'Update Details',
                    logo : 'update',
                    onpressed: ()  {
                      firstName = (firstName == null) ? widget.name : firstName;
                      userCity = (userCity == null) ? widget.city : userCity;
                      business = (business == null) ? widget.business : business;
                      userShop = (userShop == null) ? widget.shop : userShop;
                       crud.updateProfile(firstName, userCity, business, userShop);
                       Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:segura_manegerial/Welcome%20Page/welcome_screen.dart';
// import '../Custom Function And Widgets/Widgets.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:segura_manegerial/services/firebase_authentication.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// class RegistrationScreen extends StatefulWidget {
//   static String id = 'RegistrationScreen';
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }

// class _RegistrationScreenState extends State<RegistrationScreen> {
//   String email,password;
//   Auth _auth = new Auth();
//   // final _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Hero(
//               tag: 'logo',
//               child: Container(
//                 height: 150.0,
//                 child: Image.asset('assets/seguraLight.jpeg'),
//               ),
//             ),
//             SizedBox(
//               height: 48.0,
//             ),
//             TextField(
//               keyboardType: TextInputType.emailAddress,
//               onChanged: (value) {
//                 //Do something with the user input.
//                 email = value;
//               },
//               decoration: InputDecoration(
//                 hintText: 'Enter your email',
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 8.0,
//             ),
//             TextField(
//               obscureText: true,
//               onChanged: (value) {
//                 //Do something with the user input.
//                 password = value;
//               },
//               decoration: InputDecoration(
//                 hintText: 'Set a password',
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
//                   borderRadius: BorderRadius.all(Radius.circular(32.0)),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 24.0,
//             ),
//             RoundedButton(
//               colour: Colors.blueAccent,
//               text: 'Register',
//               logo: 'register',
//               onpressed: () async {
//                 try {
//                  String user = await _auth.signUp(email, password);
//                  if(user != null) {
//                    Navigator.pushNamed(context, WelcomeScreen.id);
//                  }
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
