import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Functions.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Widgets.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/flutter_otp.dart';
import 'package:segura_manegerial/onpressedevents/crud.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:segura_manegerial/phone_auth_myVs/phone_auth.dart';

class AddOfflineCustomer extends StatefulWidget {
  @override
  _AddOfflineCustomerState createState() => _AddOfflineCustomerState();
}

class _AddOfflineCustomerState extends State<AddOfflineCustomer> {
  bool isloading = false;
  bool isOtpdialog = false;

  FlutterOtp otp = new FlutterOtp();

  String _addedCustomer, _customerPhone, _otpinput;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ListView(shrinkWrap: true, children: <Widget>[
                (!isOtpdialog)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("Offline Customer", style: mainTextstyle()),
                          SizedBox(height: 10),
                          Text(
                            'Name',
                            style: mainTextstyle(),
                          ),
                          TextFormField(
                            autofocus: true,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: subTextStyle(),
                            onChanged: (value) {
                              _addedCustomer = value;
                            },
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Phone', style: mainTextstyle()),
                          TextFormField(
                              autovalidate: true,
                              autofocus: true,
                              maxLines: 1,
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              style: subTextStyle(),
                              onChanged: (value) {
                                _customerPhone = value;
                              }),
                          RoundedButton(
                            onpressed: _onpressed,
                            colour: Colors.blue,
                            text: "Add Customer",
                          ),
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          SizedBox(height: 25),
                          Text("Enter OTP", style: mainTextstyle()),
                          TextFormField(
                              showCursor: false,
                              autovalidate: true,
                              autofocus: true,
                              maxLines: 1,
                              maxLength: 4,
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              style: otpStyle2,
                              onChanged: (value) {
                                _otpinput = value;
                              }),
                          SizedBox(height: 25),
                          RoundedButton(
                            colour: Colors.blueAccent,
                            onpressed: _onVerifyOtp,
                            text: "Verify OTP",
                          ),
                        ],
                      )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  _onVerifyOtp() async {
    try {
      if (otp.resultChecker(int.parse(_otpinput))) {
        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('connected');
            CRUD.addOffineCustomer(_addedCustomer, _customerPhone);
            Timer(Duration(milliseconds: 500), () {
              setState(() {
                isloading = false;
              });
              Fluttertoast.showToast(
                msg: "Customer Added Successfully",
              );
              Navigator.pop(context);
            });
          }
        } on SocketException catch (_) {
          Fluttertoast.showToast(msg: "Not Connected to Internet");
        }
      } else {
        Fluttertoast.showToast(msg: "Wrong OTP");
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error adding Customer",
          backgroundColor: Colors.red,
          textColor: Colors.red,
          gravity: ToastGravity.BOTTOM);
    }
  }

  _onpressed() {
    if (_addedCustomer == null ||
        _addedCustomer == "" ||
        _customerPhone == "" ||
        _customerPhone == null ||
        _customerPhone.length != 10) {
      Fluttertoast.showToast(msg: "Please fill the Inputs correctly!");
    } else {
      otp.sendOtp(_customerPhone);
      setState(() {
        isOtpdialog = true;
      });
    }
  }
}

class ExtendCapacity extends StatefulWidget {
  final double value;
  ExtendCapacity(this.value);
  @override
  _ExtendCapacityState createState() => _ExtendCapacityState();
}

class _ExtendCapacityState extends State<ExtendCapacity> {
  double d, finalValue;
  // widget.value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white60, width: 3),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.blue[200]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              min: (widget.value - 30) > 0 ? widget.value - 30 : 0,
              max: widget.value + 30,
              activeColor: Colors.blue[700],
              inactiveColor: Colors.grey,
              label: (d == null)
                  ? widget.value.floor().toString()
                  : d.floor().toString(),
              divisions: 12,
              value: (d == null) ? widget.value : d,
              onChanged: (newValue) {
                setState(() {
                  d = newValue;
                  print(d);
                });
              },
            ),
            RoundedButton(
                colour: Colors.blue,
                onpressed: () {
                  CRUD.updateCapacity(
                      (d == null) ? widget.value.floor() : d.floor());
                  Navigator.pop(context);
                  Fluttertoast.showToast(msg: "Capacity Updated");
                },
                text:
                    "Confirm Capacity ${(d == null) ? widget.value.floor() : d.floor()}")
          ],
        ),
      ),
    );
  }
}
