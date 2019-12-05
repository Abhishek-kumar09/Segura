import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences pref;

class AuthCheck {
  Future<bool> checkValue() async {
    pref = await SharedPreferences.getInstance();
    return pref.containsKey('phoneNumber');
  }

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<FirebaseUser> getUser() async {
    return await _firebaseAuth.currentUser();
  }

  Future<Null> addSharedPref() async {
    try {
      if (await isLogged()) {
        pref = await SharedPreferences.getInstance();
        final user = await getUser();
        pref.setString('phoneNumber', user.phoneNumber);
        pref.setString('name', user.displayName);
        pref.setString('photo', user.photoUrl);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isLogged() async {
    try {
      final FirebaseUser user = await getUser();
      //print(user.displayName);
      return user != null;
    } catch (e) {
      return false;
    }
  }

  Future<String> getDisplayName() async {
    if (await checkValue()) {
      pref = await SharedPreferences.getInstance();
      return pref.getString('name');
    } else {
      FirebaseUser user = await getUser();
      return user.displayName;
    }
  }

  Future<String> getPhone() async {
    if (await checkValue()) {
      pref = await SharedPreferences.getInstance();
      return pref.getString('phoneNumber');
    } else {
      FirebaseUser user = await getUser();
      return user.phoneNumber;
    }
  }
}
