import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCheck {
  static Future<bool> checkValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.containsKey('phoneNumber');
  }

  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }

  static Future<Null> addSharedPref() async {
    try {
      if (await isLogged()) {
        SharedPreferences pref = await SharedPreferences.getInstance();

        final user = await getUser();
        pref.setString('phoneNumber', user.phoneNumber);
        pref.setString('name', user.displayName);
        pref.setString('photo', user.photoUrl);
        //pref.setString('email', user.email);
        pref.setBool('isLoggedIn', await isLogged());
      }
    } catch (e) {
      print(e);
    }
  }

  //static final GoogleSignIn googleSignIn = GoogleSignIn();
  static Future<bool> isLogged() async {
    try {
      final FirebaseUser user = await getUser();
      //print(user.displayName);
      return user != null;
    } catch (e) {
      return false;
    }
  }

  static Future<String> getDisplayName() async {
    if (await checkValue()) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      print("Name displayed from Shared Pref");
      return pref.getString('name');
    } else {
      FirebaseUser user = await getUser();
      return user.displayName;
    }
  }

  static Future<String> getPhone() async {
    if (await checkValue()) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getString('phoneNumber');
    } else {
      FirebaseUser user = await getUser();
      return user.phoneNumber;
    }
  }

  // static  Future<String> getEmail() async {
  //   if(await checkValue()) {
  //     pref = await SharedPreferences.getInstance();
  //     return pref.getString('email');
  //   }
  //   else {
  //     FirebaseUser user = await getUser();
  //     return  user.email;
  //   }
  // }
}
