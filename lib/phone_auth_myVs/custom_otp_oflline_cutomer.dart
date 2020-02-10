// import 'package:flutter/material.dart';
// import 'package:segura_manegerial/Custom Function And Widgets/flutter_otp.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String phoneNumber;
//   // FlutterOtp otp = FlutterOtp();
//   String result;
//   int enteredOtp;
//   @override
//   Widget build(BuildContext context) {
//     bool yesOrNo = otp.resultChecker(enteredOtp);
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           body: Center(
//             child: Column(
//               children: <Widget>[
//                 Text('Enter Phone:'),
//                 TextField(
//                   onChanged: (val) {
//                     phoneNumber = val;
//                   },
//                 ),
//                 RaisedButton(
//                   child: Text('SEND OTP'),
//                   onPressed: () {
//                     try {
//                       // otp.sendOtp(phoneNumber);
                      
//                     } catch (e) {
//                       print("Error Ocurred");
//                     }
//                     print("otp sent");
//                   },
//                 ),
//                 Text('Enter OTP sent to your phone'),
//                 TextField(
//                   onChanged: (val) {
//                     enteredOtp = int.parse(val);
//                   },
//                 ),
//                 RaisedButton(
//                   child: Text('VERIFY'),
//                   onPressed: () {
//                     setState(() {
//                       bool yesOrNo = otp.resultChecker(enteredOtp);
//                       print(yesOrNo);
//                     });
//                   },
//                 ),
//                 Center(
//                   child: Text(yesOrNo.toString()),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
