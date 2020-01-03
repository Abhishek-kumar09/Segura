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
            child: Image.network(
              widget.photo,
              fit: BoxFit.cover,
            ),
          ),
          (widget.isPremium)
                      ? Positioned(top: 180,
                        child: RowWithIcon(iconSize: iconSize,icon: Icons.star,text: "Its A Premium Order",colour: golden,textColor: Colors.white,))
                      : Container(),
          Container(
              margin: EdgeInsets.only(top: 220),
              width: double.infinity,
              height: double.infinity,
              decoration: boxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,                
                children: <Widget>[
                  SizedBox(height: 50,),
                  Text(
                    widget.name,
                    style: mainTextstyle(),
                  ),
                  SizedBox(height: 10),
                  // (widget.noofBags == 1) ? Text('${widget.noofBags} Bags') : Text('${widget.noofBags} Bag 👜️ '),
                  Text('${widget.noofBags} Bags 💼️ ',
                    style: subTextStyle(),
                  ),
                  (widget.acceptStatus)
                      ? Text(
                          '✔️ The Order is accepted',
                          style: subTextStyle(),
                        )
                      : Text("please accept the order ", style: subTextStyle()),                  
                  (widget.isDone) ? RowWithIcon(iconSize: iconSize,icon: Icons.done,text: "The Order is Successfully accomplished",colour: Colors.green,) :Text('The Order awaits customer'),
                  Padding(
                    padding: EdgeInsets.only(top: 130),
                                      child: MaterialButton(
                      padding: EdgeInsets.all(8),
                      color: Colors.green,
                       shape: CircleBorder(),
                       onPressed: () => launch('tel:${widget.phone}'),
                      child: Icon(Icons.call,
                          color: Colors.white,
                          semanticLabel: "Call the Customer",
                          size: iconSize),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
  }
