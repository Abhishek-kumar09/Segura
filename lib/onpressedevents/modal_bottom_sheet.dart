import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Functions.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Widgets.dart';
import 'package:segura_manegerial/onpressedevents/crud.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AddOfflineCustomer extends StatefulWidget {
  @override
  _AddOfflineCustomerState createState() => _AddOfflineCustomerState();
}

class _AddOfflineCustomerState extends State<AddOfflineCustomer> {
  bool isloading = false;
  String _addedCustomer, _customerPhone;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          //color: Color(0xff757575),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Offline Customer",style: mainTextstyle()),
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
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      style: subTextStyle(),
                      onChanged: (value) {
                        _customerPhone = value;
                      }),
                  RoundedButton(
                    onpressed: () {
                      setState(() {
                        isloading = true;
                      });
                      print(_addedCustomer);
                      try {
                        CRUD.addOffineCustomer(_addedCustomer, _customerPhone);
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: "Error adding Customer",
                            backgroundColor: Colors.red,
                            textColor: Colors.red,
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_SHORT);
                      }

                      Timer(Duration(milliseconds: 500), () {
                        setState(() {
                          isloading = false;
                        });
                        Fluttertoast.showToast(
                          msg: "Customer Added Successfully",
                          backgroundColor: Colors.green,
                          gravity: ToastGravity.BOTTOM,
                          textColor: Colors.white,
                          toastLength: Toast.LENGTH_SHORT,
                        );
                        Navigator.pop(context);
                      });
                    },
                    colour: Colors.blue,
                    text: "Add Customer",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.blue[200]),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              min: (widget.value - 30) > 0 ? widget.value -30 : 0,
              max: widget.value + 30,
              activeColor: Colors.blue[700],
              inactiveColor: Colors.grey,
              label: (d == null) ? widget.value.floor().toString(): d.floor().toString(), 
              divisions: 12,       
              value: (d == null) ? widget.value: d,
              onChanged: (newValue) {
                setState(() {
                  d = newValue;
                  print(d);
                });            
              },            
            ),
            RoundedButton(colour: Colors.blue,onpressed: (){ 
                CRUD.updateCapacity((d==null) ? widget.value.floor() : d.floor());
                Navigator.pop(context);
                Fluttertoast.showToast(msg: "Capacity Updated");
              },
              text: "Confirm Capacity ${(d==null) ? widget.value.floor() : d.floor()}")
          ],
        ),
      ),      
    );
  }
}