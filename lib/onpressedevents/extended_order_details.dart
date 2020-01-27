import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ExtendedOrderDetail extends StatefulWidget {
  ExtendedOrderDetail(
      {this.name,
      this.phone,
      this.noofBags,
      this.acceptStatus,
      this.isDone,
      this.isPremium,
      this.photo});
  final String name;
  final String phone;
  final noofBags;
  final String photo;
  final bool acceptStatus;
  final bool isPremium;
  final bool isDone;
  @override
  _ExtendedOrderDetailState createState() => _ExtendedOrderDetailState();
}

const TextStyle fielStyle = TextStyle(
    fontSize: 20,
    color: Colors.indigo,
    wordSpacing: 6,
    fontWeight: FontWeight.bold);

class _ExtendedOrderDetailState extends State<ExtendedOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Stack(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10),
            height: 270,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: widget.photo,
              fit: BoxFit.cover,              
            ),
          ),
          (widget.isPremium)
              ? Positioned(
                  top: 180,
                  child: RowWithIcon(
                    iconSize: iconSize,
                    icon: Icons.star,
                    text: "Its A Premium Order",
                    colour: golden,
                    textColor: Colors.white,
                  ))
              : Container(),
          Container(              
              margin: EdgeInsets.only(top: 220),
              width: double.infinity,
              height: double.infinity,
              decoration: boxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10,),
                  CustomerDetails("Name",widget.name),
                  // (widget.noofBags == 1) ? Text('${widget.noofBags} Bags') : Text('${widget.noofBags} Bag 👜️ '),
                  Divider(),CustomerDetails("No. of Bags Placed",widget.noofBags.toString() + "bag"),Divider(),
                  CustomerDetails("Order Status",(widget.acceptStatus) ? "Accepted" : "Please Accept the Order"),Divider(),
                  CustomerDetails("Completion Status",(widget.isDone) ? "Completed": "Not Completed"),Divider(),
                  // Text(
                  //   '${widget.noofBags} Bags 💼️ ',
                  //   style: subTextStyle(),
                  // ),
                  // (widget.acceptStatus)
                  //     ? Text(
                  //         'Order Status : The Order is Placed',
                  //         style: subTextStyle(),
                  //       )
                  //     : Text("please accept the order ", style: subTextStyle()),
                  // (widget.isDone)
                  //     ? RowWithIcon(
                  //         iconSize: iconSize,
                  //         icon: Icons.done,
                  //         text: "The Order is Successfully accomplished",
                  //         colour: Colors.green,
                  //       )
                  //     : Text('The Order awaits customer'),
                  Padding(
                    padding: EdgeInsets.only(top: 60,left: 40,right: 0),
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(15)),
                      onPressed: () => launch('tel:${widget.phone}'),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.call,
                              color: Colors.white,
                              semanticLabel: "Call the Customer",
                              size: iconSize),
                              Text("   Call ${widget.name}" ,style: TextStyle(color: Colors.white70,))
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class CustomerDetails extends StatelessWidget {
  final String category;
  final String detail;
  const CustomerDetails(this.category,this.detail) ;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Text(category,style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 24,shadows: [Shadow(color: Colors.black,blurRadius: 1)])),      
        Text(detail,style: TextStyle(
    color: Colors.yellowAccent[100], fontWeight: FontWeight.w600, fontSize: 24,shadows: [Shadow(color: Colors.black,blurRadius: 10)])),
      ],),
    );
  }
}
