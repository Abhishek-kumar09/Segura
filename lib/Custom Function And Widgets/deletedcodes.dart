



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