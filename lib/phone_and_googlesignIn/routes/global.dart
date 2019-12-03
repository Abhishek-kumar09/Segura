import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Globalk {
  static GoogleSignInAccount googleUser;
  static FirebaseUser firebaseUser;
  static String phoneNu;
  static String name;
  Globalk(GoogleSignInAccount googleSignedInUser, FirebaseUser fireuser) {
    googleUser = googleSignedInUser;
    firebaseUser = fireuser;
  }

  Future<GoogleSignInAccount> getGoogleUser() async {
    return  googleUser;
  }

  Future<FirebaseUser> getFirebaseuser() async{
    return  firebaseUser;
  }
  
}
