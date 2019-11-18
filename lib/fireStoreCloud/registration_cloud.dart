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
  
  static List<String> getUserInfo() {
    List<String> list = new List<String>();
   // var detail;
      _registrationData.collection('owner').document('+919354472907').get().then((doc){
        try {
          if(doc.exists) {
          print(doc.data);
          var name =  doc.data['Name'];
          print(name);
          list.add(name);
          print(list);
        }
        else {
          print('Document does not exist!');          
        }
        } catch (e) {
          print(e);
        }
     });
     return list;
  }
}