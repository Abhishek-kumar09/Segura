import 'package:flutter/material.dart';
import '../Custom Function And Widgets/Widgets.dart';
// import 'package:segura_manegerial/main.dart';
import '../ManagerPage/manager.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
import 'package:segura_manegerial/services/firebase_authentication.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:segura_manegerial/fireStoreCloud/registration_cloud.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';


class RegistrationScreen extends StatefulWidget {
  static String id = 'RegistrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email,password,firstName,lastName,business,confirmPassword,phone;
  bool showSpinner = false;
  Auth _auth = new Auth();
  String labelBusiness = "Business";
  String labelFirstName = "FirstName";
  String labelLastName = "LastName";
  String labelPhone = "Phone Number";
  String labelEmail = "Email";
  String labelPassword = "Password";
  String labelConfirmPassword = "Confirm Password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
              child: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 18.0, right: 18.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 150.0,
                    child: Image.asset('assets/seguraLight.jpeg'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.

                    setState(() {
                      if (value == "") {
                        labelFirstName = "Enter Your FirstName";
                      } else {
                        labelFirstName = "";
                      }
                    });
                    value.trim();
                      firstName = value;                  
                  },
                  decoration: buildRegisterInputDecoration(labelFirstName),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      if (value == "") {
                        labelLastName = "Enter Your LastName";
                      } else {
                        labelLastName = "";
                      }
                    });
                    value.trim();
                      lastName = value;                  
                  },
                  decoration: buildRegisterInputDecoration(labelLastName),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      if (value == "") {
                        labelPhone = "Enter Your phoneNumber";
                      } else {
                        labelPhone = "";
                      }
                    });
                    value.trim();
                      phone = value;                  
                  },
                  decoration: buildRegisterInputDecoration(labelPhone),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    //Do something with the user input.
                    setState(() {
                      if (value == "") {
                        labelBusiness = "Enter Your Buisness";
                      } else {
                        labelBusiness = "";
                      }
                    });
                    value.trim();
                      business = value;                  
                  },
                  decoration: buildRegisterInputDecoration(labelBusiness),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      if (value == "") {
                        labelEmail = "Enter Your Email";
                      } else {
                        labelEmail = "";
                      }
                    });
                    value.trim();
                      email = value;                  
                  },
                  decoration: buildRegisterInputDecoration(labelEmail),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      if (value == "") {
                        labelPassword = "Enter Your Password";
                      } else {
                        labelPassword = "";
                      }
                    });
                    //Do something with the user input.
                      value.trim();
                      password = value;                  
                  },
                  decoration: buildRegisterInputDecoration(labelPassword),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(              
                  obscureText: true,
                  onChanged: (value) {
                    value.trim();
                    setState(() {                      
                      if (value == "") {
                        labelConfirmPassword = "Enter Your Password Again";
                      } else if(value != password) {
                        labelConfirmPassword = "Password Doesn\'t match";
                      }
                      else {
                        labelConfirmPassword = "";
                      }
                    }); 
                    confirmPassword =value;                     
                  },
                  decoration: buildRegisterInputDecoration(labelConfirmPassword),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  colour: Colors.blueAccent,
                  text: 'Register',
                  logo: 'register',
                  onpressed: () async{
                    setState(() {
                     showSpinner =true; 
                    });
                     try {
                   String user = await _auth.signUp(email, password);
                   if(user != null && confirmPassword == password) {
                     RegistrationDataBase.pushUserInfo(firstName, lastName, business, email, password);
                     Navigator.pushNamed(context, Manager.id);
                   }                  
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                   showSpinner = false; 
                  });
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
