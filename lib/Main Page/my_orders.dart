import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Widget1 extends StatefulWidget {
  @override
  _Widget1State createState() => _Widget1State();
}

class _Widget1State extends State<Widget1> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('/owner/+919354472907/myOrders')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final orderDetails = snapshot.data.documents;
          List<WidgetList> list = [];
          for (var order in orderDetails) {
            final name = order.data['customerName'];
            final nameWidget = WidgetList(
              name: name,
              phone: order.data['customerPhone'],
              bagCount: order.data['noOfBags'],
            );
            list.add(nameWidget);
          }
          return ListView(
            children: list,
          );
        });
  }
}

class WidgetList extends StatefulWidget {
  WidgetList({Key key, this.name, this.phone, this.bagCount})
      : assert(name != null),
        assert(phone != null);
  //assert(bagCount != null);

  final String phone;
  final String name;
  final String bagCount;
  //final String photo;

  @override
  _WidgetListState createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(252),
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(backgroundColor: Color(0xFF000000)),
          title: Text(widget.name),
          subtitle: Text(widget.phone),
          trailing: Text("${widget.bagCount} bags"),          
        ),
      ),
    );
  }
}
