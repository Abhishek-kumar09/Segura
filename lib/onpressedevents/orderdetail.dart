import 'package:flutter/material.dart';

class ExtendedOrderDetail extends StatefulWidget {
  @override
  _ExtendedOrderDetailState createState() => _ExtendedOrderDetailState();
}

class _ExtendedOrderDetailState extends State<ExtendedOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            height: 200,
            width: double.infinity,
            child: Image.network(
                      "https://cdn.vox-cdn.com/thumbor/wI3iu8sNbFJSQB4yMLsoPMNzIHU=/0x0:3368x3368/1200x800/filters:focal(1188x715:1726x1253)/cdn.vox-cdn.com/uploads/chorus_image/image/62994726/AJ_Finn_author_photo_color_photo_courtesy_of_the_author.0.jpg",
                      fit: BoxFit.cover,
                  ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text("Name"),
                Text("phone"),
                Text("anotherField"),
                Text("AnotherField")
              ],
            ),
          ),
          BottomAppBar(
            clipBehavior: Clip.hardEdge,
            elevation: 10,
            color: Colors.amber,
            notchMargin: 12,
          ),
        ],
      ),
    );
  }
}
