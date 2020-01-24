import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Widgets.dart';
import 'package:segura_manegerial/Login%20And%20Register/edit_profile.dart';
import 'package:segura_manegerial/Main%20Page/my_orders.dart';
import 'package:segura_manegerial/Main%20Page/my_profile.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Widgets.dart';
import 'package:segura_manegerial/Login%20And%20Register/edit_profile.dart';
import 'package:segura_manegerial/Main%20Page/my_orders.dart';
import 'package:segura_manegerial/Main%20Page/my_profile.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';
import 'package:segura_manegerial/Profile_Page/Profile_Page.dart';

class MainPage extends StatefulWidget {
  MainPage({@required this.phone});
  final String phone;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  FirebaseUser appuser;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    )..addListener(() {});
    getUser();
  }

  void getUser() async {
    appuser = await AuthCheck.getUser();
    setState(() {});
  }

  void onSelected() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushNamedAndRemoveUntil(
          loginScreen, (Route<dynamic> route) => false);
      Fluttertoast.showToast(msg: "Signed Out");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error while SignOut");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SEGURA',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Segura'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/seguraLight.jpeg',
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Orders',
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Profile',
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Nami == null
                      ? Profile_Page()
                      : ProfileBuider(widget.phone, appuser);
                }));
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Sign Out',
              ),
              onTap: () {
                onSelected();
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Close',
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
              trailing: Icon(
                Icons.keyboard_backspace,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: MyOrders(
        phoneNumber: widget.phone,
      ),
    );
  }
}
