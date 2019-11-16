import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:segura_manegerial/Main%20Page/my_orders.dart';
import 'package:segura_manegerial/Main%20Page/my_profile.dart';


import 'package:segura_manegerial/fireStoreCloud/owner_details.dart';

//import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    CustomerDetails.getCustomerDetails();
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
          Widget1(),
          Text('HelloGuys2'),
          MyProfile()
        ],
      ),
    );
  }
}

