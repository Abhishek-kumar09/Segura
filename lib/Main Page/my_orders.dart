import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:segura_manegerial/Custom%20Function%20And%20Widgets/Functions.dart';
import 'package:segura_manegerial/onpressedevents/extended_order_details.dart';
import 'package:segura_manegerial/onpressedevents/modal_bottom_sheet.dart';

class MyOrders extends StatelessWidget {
  MyOrders({@required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            //showModalBottomSheet(context: context,builder: (context) => AddOfflineCustomer() );
            showModalBottomSheet<void>(
  isScrollControlled: true,
  context: context,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0)),
  ),
  builder: (BuildContext context) => AddOfflineCustomer()
);
        },
        splashColor: Colors.teal[800],
        backgroundColor: Colors.green,elevation: 10,child: Icon(Icons.add,color: Colors.green[900],size: iconSize),mini: true,tooltip: "Tap to add customers"),
          body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('/owner/$phoneNumber/myOrders')
              .snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.none) {
              Fluttertoast.showToast(msg: "NO INTERNET");                            
            } 
            if (!snapshot.hasData) {
              print('no');
              return Center(child: CircularProgressIndicator());
            } 
            final orderDetails = snapshot.data.documents;
            
            if(orderDetails.length == 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    child: Image.asset('assets/rsznoorder.jpg')),
                  Center(
                    child: Text("Customers will soon reach\n        you through Segura",style:TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                  )))
                ],
              );
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
            }
            return ListView(
              children: list,
            );
          }),
    );
  }
}

class SingleOrderCard extends StatelessWidget {
  SingleOrderCard({Key key, this.name, this.phone, this.bagCount,this.isPremium,this.isDone,this.photo,this.acceptStatus})
      : assert(name != null),
        assert(phone != null);

  final String phone;
  final String name;
  final int bagCount;
  final bool isPremium;
  final bool isDone;
  final String photo;
  final bool acceptStatus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
       // color: !(isPremium)?Colors.blue[900] : golden,
       color: Colors.blue[900],
        textStyle: TextStyle(color: Colors.white),
        borderOnForeground: true,
        borderRadius: BorderRadius.circular(252),
        elevation: 14,
        child: ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ExtendedOrderDetail(name: name,noofBags: bagCount,phone: phone,isDone: isDone,isPremium: isPremium,photo: photo,acceptStatus: acceptStatus,)));
          },
          leading: CircleAvatar(backgroundImage: CachedNetworkImageProvider(photo),backgroundColor: Colors.blue[100],),
          title: Text(name,style: TextStyle(color: Colors.white)),
          subtitle: Text(phone,style: TextStyle(color: Colors.white),),
          trailing: Text("$bagCount bags"),                 
        ),
      ),
    );
  }
}

