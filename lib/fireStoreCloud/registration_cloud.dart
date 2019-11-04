import 'package:cloud_firestore/cloud_firestore.dart';


class RegistrationDataBase {
   static final Firestore _registrationData = Firestore.instance;
   static void pushUserInfo(String firstName,String lastName,String business, String emailAddress, String password ) {
    _registrationData.collection('registrationDetails').document(emailAddress).setData({
      'firstName' : firstName,
      'lastName' : lastName,
      'business' : business,
      'email' : emailAddress,
      'password' : password
    });     
  }
}