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
  bool isloading =  false;
  String _addedCustomer, _customerPhone;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(      
      inAsyncCall: isloading ,
          child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          //color: Color(0xff757575),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
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
                      CRUD.addOffineCustomer(_addedCustomer, _customerPhone);
                      setState(() {  
                        isloading = false;
                      });
                      Navigator.pop(context);
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


