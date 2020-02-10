import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:segura_manegerial/onpressedevents/modal_bottom_sheet.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';

FloatingActionButton addCustomerFAB(BuildContext context) {
  return FloatingActionButton(
      onPressed: () {
        //showModalBottomSheet(context: context,builder: (context) => AddOfflineCustomer() );
        showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
            ),
            builder: (BuildContext context) => AddOfflineCustomer());
      },
      splashColor: Colors.teal[800],
      backgroundColor: Colors.green,
      elevation: 10,
      child: Icon(Icons.add, color: Colors.green[900], size: iconSize),
      mini: true,
      tooltip: "Tap to add customers");
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
    title: Text('SEGURA OWNER'),
  );
}
