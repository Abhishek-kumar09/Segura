import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:segura_manegerial/Login%20And%20Register/edit_profile.dart';
import 'package:segura_manegerial/Main%20Page/my_orders.dart';
import 'package:segura_manegerial/Main%20Page/my_profile.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segura_manegerial/onpressedevents/crud.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';
import 'package:segura_manegerial/Custom Function And Widgets/fab_and_gradientappbar.dart';

String photoUrl;

class MainPage extends StatefulWidget {
  MainPage({@required this.phone});
  final String phone;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // TabController _tabController;

  FirebaseUser appuser;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    appuser = await AuthCheck.getUser();
    await CRUD.getUploadedImageUrl().then((url) {
      photoUrl = url;
      setState(() {});
    });
  }

  void onSelected() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Alert(context: context,title: "Text('data')");
      Navigator.of(context).pushNamedAndRemoveUntil(
          loginScreen, (Route<dynamic> route) => false);
      Fluttertoast.showToast(msg: "Signed Out");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error while SignOut");
    }
  }

//Drawers---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addCustomerFAB(context),
      appBar: buildGradientAppBar(),
      drawer: Drawer(
        elevation: 20,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/t1.jpg',
                      ),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black54, BlendMode.darken))),
              accountEmail: Text(widget.phone),
              accountName: Text('Segura'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: (photoUrl == null || photoUrl == '')
                      ? AssetImage('assets/t1.jpg')
                      : CachedNetworkImageProvider(photoUrl)),
            ),
            ListTile(
              leading: Icon(Icons.loyalty),
              title: Text('Orders'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfileBuider(widget.phone, appuser)));
              },
            ),
            Divider(),
            ListTile(leading: Icon(Icons.import_contacts), title: Text('FAQ')),
            Divider(),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Sign Out'),
              onTap: () {
                onSelected();
              },
            ),
            
            Divider(),
            ListTile(
              title: Text('Close'),
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
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('/owner/${widget.phone}/myOrders')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              Fluttertoast.showToast(msg: "NO INTERNET");
            }
            if (!snapshot.hasData) {
              print('no');
              return Center(child: CircularProgressIndicator());
            }
            final orderDetails = snapshot.data.documents;

            if (orderDetails.length == 0) {
              return Nocustomer();
            }
            List<SingleOrderCard> list = [];
            for (var order in orderDetails) {
              final nameWidget = SingleOrderCard(
                name: order.data['customerName'],
                phone: order.data['customerPhone'],
                bagCount: order.data['noOfBags'],
                isPremium: order.data['isPremium'],
                isDone: order.data['isDone'],
                photo: order.data['photoUrl'],
                acceptStatus: order.data['acceptStatus'],
              );              
              list.add(nameWidget);
              if(list.length == 0) {
                  return Nocustomer();
              }              
            }
            return ListView(
              children: list,
            );
          }),
    );
  }
}

class Nocustomer extends StatelessWidget {
  const Nocustomer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset('assets/rsznoorder.jpg')),
        Center(
            child: Text(
                "Customers will soon reach\n        you through Segura",
                style: TextStyle(color: Colors.grey, fontSize: 20)))
      ],
    );
  }
}

class ProfileBuider extends StatelessWidget {
  ProfileBuider(this.phoneNumber, this.user);
  final String phoneNumber;
  final FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('/owner/$phoneNumber/ownerDetails')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.pink,
            ));
          }
          final userdetails = snapshot.data.documents;
          if (userdetails.length == 0) {
            return Scaffold(
              body: EditProfile(user: user),
            );
          }
          Widget myprofile;
          for (var userdetail in userdetails) {
            final name = userdetail.data['name'].toString();
            final business = userdetail.data['business'].toString();
            final photo = userdetail.data['imageURL'];
            final city = userdetail.data['city'];
            final bagCollected = userdetail.data['bagsCollected'];
            final earnings = userdetail.data['earning'];
            final phone = userdetail.data['phone'];
            final email = userdetail.data['email'];
            final shop = userdetail.data['shop'];
            final capacity = userdetail.data['capacity'];
            myprofile = MyProfile(
              name: name,
              photo: photo,
              business: business,
              city: city,
              bagCollected: bagCollected,
              earnings: earnings,
              phone: phone,
              email: email,
              shop: shop,
              capacity: capacity,
            );
          }
          return Scaffold(
            body: myprofile,
          );
          // return CircularProgressIndicator(backgroundColor: Colors.teal,);
        });
  }
}
