import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:segura_manegerial/Main%20Page/my_orders.dart';
import 'package:segura_manegerial/Main%20Page/my_profile.dart';

class MainPage extends StatefulWidget {
  MainPage({@required this.phone});
  final String phone;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 3,
    )..addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(colors: [Colors.blue[600],Color(0xFF060233)],begin: Alignment.topCenter,end: Alignment.bottomCenter),
        elevation: 10,
        // centerTitle: true,
        leading: Image.asset('assets/logo1.png'),
        primary: true,
        title: Text('SEGURA OWNER',),
        bottom: TabBar(          
          tabs: <Widget>[
            Tab(child: Text('MY ORDERS')),
            Tab(child: Text('MY SPACE')),
            Tab(child: Text('MYSELF'))
          ],
          indicatorColor: Colors.blue[700], controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 6,
          //labelPadding: EdgeInsets.only(bottom: 15,top:25),
          unselectedLabelColor: Colors.lightBlueAccent,
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, shadows: [
            Shadow(
              color: Colors.black38,
              blurRadius: 2,
            )
          ]),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          MyOrders(phoneNumber: widget.phone,),
          Text('HelloGuys2'),
          ProfileBuider(widget.phone)         
        ],
      ),
    );
  }  
}



class ProfileBuider extends StatelessWidget {
  ProfileBuider(this.phoneNumber);
final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('/owner/$phoneNumber/ownerDetails').snapshots(),      
      builder: (context, snapshot) {
        if(!snapshot.hasData) {return Center(child: CircularProgressIndicator(backgroundColor: Colors.pink,));}
        final userdetails = snapshot.data.documents;
        Widget myprofile;
        for(var userdetail in userdetails) {
        final name = userdetail.data['name'].toString();        
        final business = userdetail.data['business'].toString();
        final photo = userdetail.data['photoURL'];
        final city = userdetail.data['city'];
        final bagCollected = userdetail.data['bagsCollected'];
        final earnings = userdetail.data['earnings'];
        final phone = userdetail.data['phone'];
        final email = userdetail.data['email'];
        final shop = userdetail.data['shop'];
        myprofile =  MyProfile(name: name,photo: photo,business: business,city: city,bagCollected: bagCollected,earnings: earnings,phone: phone,email:email,shop: shop,);
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
