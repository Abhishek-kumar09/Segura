import 'package:flutter/material.dart';
class DetailGrab extends StatefulWidget {
  @override
  _DetailGrabState createState() => _DetailGrabState();
}

class _DetailGrabState extends State<DetailGrab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              TextFormField()
            ],
      ),
    );
  }
}