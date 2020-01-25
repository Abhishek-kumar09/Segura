import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:segura_manegerial/Login%20And%20Register/edit_profile.dart';
import 'package:segura_manegerial/Main%20Page/my_orders.dart';
import 'package:segura_manegerial/Main%20Page/my_profile.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:segura_manegerial/onpressedevents/firebaseauth.dart';

// class MainPage extends StatefulWidget {
//   MainPage({@required this.phone});
//   final String phone;
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage>
//     with SingleTickerProviderStateMixin {
//   TabController _tabController;
//   FirebaseUser appuser;
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(
//       vsync: this,
//       length: 2,
//     )..addListener(() {});
//     getUser();
//   }

//   void getUser() async {
//     appuser = await AuthCheck.getUser();
//     setState(() {});
//   }

//   void onSelected(choice) async{
//   try{await FirebaseAuth.instance.signOut();
//   Navigator.of(context).pushNamedAndRemoveUntil(loginScreen, (Route<dynamic> route)=>false);
//   Fluttertoast.showToast(msg: "Signed Out");}
//   catch (e){
//     Fluttertoast.showToast(msg: "Error while SignOut");
//   }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: GradientAppBar(
//         gradient: LinearGradient(colors: [Colors.blue[800],darkblue],begin: Alignment.topLeft,end: Alignment.bottomRight),
//         elevation: 10,
//         // centerTitle: true,
//         leading: Padding(          
//           padding: const EdgeInsets.all(10.0),
//           child: CircleAvatar(backgroundImage: AssetImage('assets/logo1.png'),backgroundColor: Colors.white,)
//         ),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: onSelected,
//   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//         const PopupMenuItem<String>(
//           value: "signOut",
//           child: 
//           RowWithIcon(icon: Icons.person_outline,text: ' Sign Out',iconSize: 16,colour: Colors.black,)),
//   ],
// )]   ,
//         primary: true,
//         title: Text('SEGURA OWNER',),
//         bottom: TabBar(          
//           tabs: <Widget>[
//             Tab(child: Text('MY ORDERS')),
//             Tab(child: Text('MYSELF'))
//           ],
//           indicatorColor: Colors.blue[700], controller: _tabController,
//           indicatorSize: TabBarIndicatorSize.tab,
//           indicatorWeight: 6,
//           unselectedLabelColor: Colors.lightBlueAccent,
//           unselectedLabelStyle:
//               TextStyle(fontWeight: FontWeight.bold, shadows: [
//             Shadow(
//               color: Colors.black38,
//               blurRadius: 2,
//             )
//           ]),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: <Widget>[
//           MyOrders(phoneNumber: widget.phone,),
//           ProfileBuider(widget.phone,appuser)         
//         ],
//       ),
//     );
//   }  
// }

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
    setState(() {});
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
              accountEmail: Text(appuser.phoneNumber),
              accountName: Text('Segura'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  'assets/t1.jpg'                  
                ),
              ),
            ),
            ListTile(
              title: Text('Orders'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
            ListTile(
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
            ListTile(
              title: Text(
                'Sign Out'
              ),
              onTap: () {
                onSelected();
              },
            ),
            Divider(),
            ListTile(title: Text('FAQ')),
            Divider(),
            ListTile(
              title: Text(
                'Close'
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

  GradientAppBar buildGradientAppBar() {
    return GradientAppBar(
      gradient: LinearGradient(
          colors: [Colors.blue[800], darkblue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      elevation: 10,
      primary: true,
      centerTitle: true,
      title: Text(
        'SEGURA OWNER'
      ),
    );
  }
}



class ProfileBuider extends StatelessWidget {
  ProfileBuider(this.phoneNumber,this.user);
final String phoneNumber;
final FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('/owner/$phoneNumber/ownerDetails').snapshots(),      
      builder: (context, snapshot) {
        if(!snapshot.hasData) {return Center(child: CircularProgressIndicator(backgroundColor: Colors.pink,));}
        final userdetails = snapshot.data.documents;
        if(userdetails.length == 0) {
          return Scaffold(
            body: EditProfile(user: user),
          );
        }
        Widget myprofile;
        for(var userdetail in userdetails) {
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
        myprofile =  MyProfile(name: name,photo: photo,business: business,city: city,bagCollected: bagCollected,earnings: earnings,phone: phone,email:email,shop: shop,capacity: capacity,);
        }
        return Scaffold(
            body: myprofile,
        );
        // return CircularProgressIndicator(backgroundColor: Colors.teal,);
      }
    );
  }
}





// Future<Widget> buildMyProfile() async {
//   Widget builtWidgetProfile;
//   final db = Firestore.instance;
//    await db.collection('owner').document('+919354472907').get().then(
//     (doc) {
//       if(doc.exists) {
//         final name = doc.data['name'].toString();        
//         final business = doc.data['business'].toString();
//         final photo = doc.data['photoURL'];
//         final city = doc.data['city'];
//         final bagCollected = doc.data['bagCollected'];
//         final earnings = doc.data['earnings'];
//         print(name);
//         builtWidgetProfile = MyProfile(name: name,business: business,photo: photo,city: city,bagCollected: bagCollected,earnings: earnings,);       
//       }
//       return builtWidgetProfile;
//     }
//   ).catchError((e) {
//     print(e);
//     return CircularProgressIndicator();
//   });
//   return builtWidgetProfile;
// }
// class AA extends StatefulWidget {
//   @override
//   _AAState createState() => _AAState();
// }

// class _AAState extends State<AA> {
//   @override
//   void initState() async{
//    await  buildMyProfile();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(      
//     );
//   }
// }
