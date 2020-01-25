import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:segura_manegerial/onpressedevents/extended_order_details.dart';

class SingleOrderCard extends StatelessWidget {
  SingleOrderCard(
      {Key key,
      this.name,
      this.phone,
      this.bagCount,
      this.isPremium,
      this.isDone,
      this.photo,
      this.acceptStatus})
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExtendedOrderDetail(
                          name: name,
                          noofBags: bagCount,
                          phone: phone,
                          isDone: isDone,
                          isPremium: isPremium,
                          photo: photo,
                          acceptStatus: acceptStatus,
                        )));
          },
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(photo),
            backgroundColor: Colors.blue[100],
          ),
          title: Text(name, style: TextStyle(color: Colors.white)),
          subtitle: Text(
            phone,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text("$bagCount bags"),
        ),
      ),
    );
  }
}
