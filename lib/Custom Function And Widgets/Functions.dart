import 'package:flutter/material.dart';


  InputDecoration buildLoginInputDecoration(String hintText,IconData icon) {
    
    return InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(icon),
              ),
              hintText: hintText,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            );
  }


  InputDecoration buildRegisterInputDecoration(String labelText) {
    return InputDecoration(
                labelText: labelText,
                
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              );
  }




  

  //  Alert showAlert(BuildContext context, String title, String subText,String firstButtonText,String secondButtonText ) {
  //   return Alert(
  //               context: context,
  //               type: AlertType.warning,
  //               title: title,
  //               desc: subText,
  //               buttons: [
  //                 DialogButton(
  //                   child: Text(
  //                     firstButtonText,
  //                     style: TextStyle(color: Colors.white, fontSize: 20),
  //                   ),
  //                   onPressed: () => Navigator.pop(context),
  //                   color: Colors.lightBlueAccent,
  //                 ),
  //                 DialogButton(
  //                   child: Text(
  //                     secondButtonText,
  //                     style: TextStyle(color: Colors.white, fontSize: 20),
  //                   ),
  //                   onPressed: () => Navigator.pop(context),
  //                   gradient: LinearGradient(colors: [
  //                     Color.fromRGBO(116, 116, 191, 1.0),
  //                     Color.fromRGBO(52, 138, 199, 1.0)
  //                   ]),
  //                 )
  //               ],
  //             );
  // }
