// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Functions.dart';
// import 'package:segura_manegerial/phone_and_googlesignIn/routes/auth.dart';

// class MainScreen extends StatefulWidget {
//   final GoogleSignInAccount googleUser;
//   final FirebaseUser firebaseUser;
//   // final String phone;
//   //final phoneNumber = firebaseUser.phoneNumber;

//   const MainScreen(
//       {Key key, @required this.googleUser, @required this.firebaseUser})
//       : assert(googleUser != null),
//         assert(firebaseUser != null),
//         super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {  
//  // @override
//   // void initState() async{
//   //   super.initState();
//   // final String phone = widget.firebaseUser.phoneNumber;  
//   //   if(widget.firebaseUser != null) {
//   //     final snapShot = await Firestore.instance.collection('/owner').document('$phone').get();
//   //     if(snapShot == null || !snapShot.exists) {
//   //       //not exist
        
//   //     } else {
//   //         //exist  
//   //     }
//   //   }
//   // }
//   @override
//   Widget build(BuildContext context) {
//     String label = "Enter the time boy";
//     final theme = Theme.of(context);
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Offstage(
//               offstage: widget.firebaseUser.photoUrl == null,
//               child: CircleAvatar(
//                   backgroundImage: NetworkImage(widget.firebaseUser.photoUrl)),
//             ),
//             SizedBox(height: 8.0),
//             Text(widget.firebaseUser.displayName, style: theme.textTheme.title),
//             Text(widget.googleUser.email),
//             Text(widget.firebaseUser.phoneNumber, style: theme.textTheme.subhead),
//             SizedBox(height: 16.0),
//             TextFormField(
//                 initialValue: "widget.business",
//                 onChanged: (value) {
//                   value.trim();
//                   // business = (value == null) ? widget.business : value;
//                 },
//                 decoration: buildRegisterInputDecoration(label)),
//             FlatButton(
//               child: Text("Sign out", style: theme.textTheme.button),
//               onPressed: () async {
//                 //  String phone =firebaseUser.phoneNumber.toString();
//                 //  print(phone);
//                 await GoogleSignIn().signOut();

//                 widget.googleUser.clearAuthCache();
//                 print('SignedOut');
//                 //await GoogleSignIn().disconnect();
//                 await widget.firebaseUser.delete();
//                 await FirebaseAuth.instance.signOut();

//                 print('signedOut from FireBase');
//                 Navigator.of(context).pushAndRemoveUntil(
//                   CupertinoPageRoute(builder: (context) => AuthScreen()),
//                   (route) => false,
//                 );
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
