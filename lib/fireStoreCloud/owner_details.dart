import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segura_manegerial/phone_and_googlesignIn/routes/auth.dart';
import 'package:segura_manegerial/phone_and_googlesignIn/routes/global.dart';
import 'package:segura_manegerial/phone_and_googlesignIn/routes/main_screen.dart';

class CustomerDetails {
  final String phone = Globalk.phoneNu;
  final String name = Globalk.name;
     static final Firestore _registrationData = Firestore.instance;
      static void getCustomerDetails() async{
        await for(var snapShots in _registrationData.collection('/owner/+919354472907/myOrders').snapshots()) {
          for(var details in snapShots.documents) {
            print(details.data);
          }
        }                    
      }    
}
