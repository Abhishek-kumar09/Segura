// import 'package:flutter/material.dart';
// import 'package:segura_manegerial/Login%20And%20Register/registration_screen.dart';
// import 'package:segura_manegerial/services/firebase_authentication.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import '../Custom Function And Widgets/Widgets.dart';
// import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';

// //TODO: NEEDS MODIFICATION 
// class LoginScreen extends StatefulWidget {
//   static String id = 'loginScreen';
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {

//   Auth _auth = new Auth();
//   String email, password;
//   bool showSpinner = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,

//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//               child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Hero(
//               tag: 'logo',
//               child: Container(
//                 child: Image.asset('assets/seguraLight.jpeg'),
//                 constraints: BoxConstraints(maxHeight: 150),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Bacause your stuff is not just "stuff"',
//               style: TextStyle(fontWeight: FontWeight.w800),
//             ),
//             SizedBox(
//               height: 48.0,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 10.0),
//               child: TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 onChanged: (value) {
//                   //Do something with the user input.
//                   email = value;
//                 },
//                 decoration: buildLoginInputDecoration('Enter Email',Icons.person),
//                 validator: (value) =>
//                     value.isEmpty ? 'Email can\'t be empty' : null,
//                 onSaved: (value) => email = value.trim(),
//               ),
//             ),
//             SizedBox(
//               height: 8.0,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 10.0),
//               child: TextFormField(
//                 obscureText: true,
//                 onChanged: (value) {
//                   //Do something with the user input.
//                   password = value;
//                 },
//                 decoration: buildLoginInputDecoration('Enter Password',Icons.lock),
//                 validator: (value) =>
//                     value.isEmpty ? 'Password can\'t be empty' : null,
//                 onSaved: (value) => password = value.trim(),
//               ),
//             ),
//             SizedBox(
//               height: 24.0,
//             ),
//             RoundedButton(
//               text: 'Login',
//               logo: 'login',
//               colour: Colors.lightBlueAccent,
//               onpressed: () async {
//                 setState(() {
//                  showSpinner = true; 
//                 });
//                 try {
//                   String user = await _auth.signIn(email, password);
//                   if (user != null) {
//                     print(email);
//                    // TODO: Navigator.pushNamed(context, Manager.id);
//                   }
//                 } catch (e) {
//                   // Alert(context: context, title: "Segura for Owner", desc: "Email or passWord incorrect").show();
//                   Alert(
//                     context: context,
//                     type: AlertType.warning,
//                     title: "Login Alert",
//                     desc: "Wrong email or password",
//                     buttons: [
//                       DialogButton(
//                         child: Text(
//                           "Back",
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                         onPressed: () => Navigator.pop(context),
//                         color: Colors.lightBlueAccent,
//                       ),
//                       DialogButton(
//                         child: Text(
//                           "New User",
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                         onPressed: () => Navigator.pushNamed(context, RegistrationScreen.id),
//                         gradient: LinearGradient(colors: [
//                           Color.fromRGBO(116, 116, 191, 1.0),
//                           Color.fromRGBO(52, 138, 199, 1.0)
//                         ]),
//                       )
//                     ],
//                   ).show();
//                 }
//                 setState(() {
//                  showSpinner = false; 
//                 });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

