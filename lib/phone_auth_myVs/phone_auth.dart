import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Functions.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Widgets.dart';
import 'package:segura_manegerial/Login%20And%20Register/edit_profile.dart';
import 'package:segura_manegerial/Main%20Page/main_page.dart';

TextStyle otpStyle = TextStyle(
    fontSize: 34,
    letterSpacing: 15,
    fontWeight: FontWeight.bold,
    color: Color(0xff54B24D));

TextStyle phoneInput = TextStyle(
    color: Colors.blue, fontWeight: FontWeight.bold,letterSpacing: 2);

class PhoneAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyAppPage(title: 'Phone Authentication');
  }
}

class MyAppPage extends StatefulWidget {
  MyAppPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value) {
        print('sign in');
      });
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: this.phoneNo, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: const Duration(seconds: 20),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (AuthException exceptio) {
            print('${exceptio.message}');
          });
    } catch (e) {
      handleError(e);
    }
  }

  Future<bool> smsOTPDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              color: Colors.white,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        height: 120,
                        color: Colors.white,
                        child: Image.asset('assets/otp-sms.png')),
                    (errorMessage != ''
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              errorMessage,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Container()),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus: true,
                        textAlign: TextAlign.center,
                        maxLength: 6,
                        style: otpStyle,
                        cursorColor: Color(0xff54B24D),
                        onChanged: (value) {
                          this.smsOTP = value;
                        },
                      ),
                    ),
                    FlatButton(
                      child: Text('Done',style: TextStyle(color: Color(0xff54B24D)),),
                      onPressed: () {
                        _auth.currentUser().then((user) {
                          if (user != null) {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainPage(phone: user.phoneNumber)));
                            print('user!=null is executed');
                          } else {
                            print('user == null is executed');
                            signIn();
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  signIn() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      final AuthResult user = await _auth.signInWithCredential(credential);
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.user.uid == currentUser.uid);
      if (user.additionalUserInfo.isNewUser) {
        print('Its a new User');
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => EditProfile(user: currentUser)));
      } else {
        print('Old User');
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MainPage(phone: currentUser.phoneNumber)));
      }
    } catch (e) {
      handleError(e);
    }
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        smsOTPDialog(context).then((value) {
          print('verification done');
        }).catchError((onError) {
          handleError(onError);
        });
        break;
      default:
        setState(() {
          errorMessage = error.message;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/seguraWithText.jpeg'),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  height: 100,
                  width: 350,
                  child: TextFormField(                    
                    maxLength: 10,
                    style: phoneInput,
                    keyboardType: TextInputType.phone,
                    decoration: buildLoginInputDecoration(
                        "10 Digit Mobile No.", Icons.phone),
                    // InputDecoration(
                    //   enabled: true,
                    //   hintText: '10 Digit Phone Number',
                    //   hintStyle: subTextStyle(),
                    //   counterStyle: bigNumeric,
                    //   ),
                    onChanged: (value) {
                      this.phoneNo = "+91$value";
                    },
                  ),
                ),
              ),
              (errorMessage != ''
                  ? Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red),
                    )
                  : Container()),
              SizedBox(
                height: 10,
              ),
              RoundedButton(
                onpressed: () {
                  verifyPhone();
                },
                text: "Send OTP",
                colour: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// return new AlertDialog(
//             shape: Border(
//                 bottom: BorderSide(
//                     style: BorderStyle.solid, color: Colors.blue, width: 5)),
//             backgroundColor: Colors.lightBlue[100],
//             title: Text('Enter SMS Code'),
//             content: Container(
//               height: (errorMessage != null || errorMessage != '') ? 150 : 110,
//               child: Column(children: [
//                 (errorMessage != ''
//                     ? Center(
//                         child: Icon(
//                         Icons.warning,
//                         color: Colors.yellow,
//                         size: 39,
//                       ))
//                     : Container()),
//                 TextField(
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     this.smsOTP = value;
//                   },
//                 ),
//                 (errorMessage != ''
//                     ? Text(
//                         errorMessage,
//                         style: TextStyle(color: Colors.red),
//                       )
//                     : Container())
//               ]),
//             ),
//             contentPadding: EdgeInsets.all(10),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('Done'),
//                 onPressed: () {
//                   _auth.currentUser().then((user) {
//                     if (user != null) {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => MainPage(phone: user.phoneNumber)));
//                           print('user!=null is executed');
//                     } else {
//                       print('user == null is executed');
//                       signIn();
//                     }
//                   });
//                 },
//               )
//             ],
//           );
