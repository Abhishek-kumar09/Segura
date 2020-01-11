import 'package:flutter/material.dart';
import 'package:segura_manegerial/Login%20And%20Register/edit_profile.dart';
import 'package:segura_manegerial/Main%20Page/main_page.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';
import 'package:segura_manegerial/phone_auth_myVs/homepage.dart';
import 'package:segura_manegerial/phone_auth_myVs/phone_auth.dart';
import 'Custom Function And Widgets/Functions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SplashScreen(
  //   backgroundColor: Colors.blue[900],seconds: 5,image: Image.asset('assets/logo1.png'),
  // loadingText: Text('Welcome To Segura /n Your Luggage our Segurity'),
  // loaderColor: Colors.amber,title: Text("Manager in Segura"),
  // );
  void mainFunction() async {
  final bool islogged = await AuthCheck.isLogged();
  String phone = islogged ? await AuthCheck.getPhone() : '';
  print(islogged);
  runApp(MyApp(
    initialRoute: islogged ? mainScreen : loginScreen,
    phone: phone,
  ));
  }
  mainFunction();
}

class MyApp extends StatelessWidget {
  MyApp({@required this.initialRoute, this.phone});
  final String initialRoute;
  final String phone;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Auth',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.white,
          errorColor: Colors.red,
          primaryColor: Colors.blue,
          accentColor: Colors.blue[900]),
      initialRoute: initialRoute,
      routes: {
        mainScreen: (context) => MainPage(phone: phone),
       homepage: (BuildContext context) => MyHome(),
         editProfile: (context)=> EditProfile(),
        loginScreen: (context) => PhoneAuth()
      },
    );
  }
}
