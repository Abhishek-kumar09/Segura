import 'package:flutter/material.dart';
//  import 'package:cloud_firestore/cloud_firestore.dart';
TextStyle title =TextStyle(fontWeight: FontWeight.w800,fontSize: 25);
TextStyle bigNumeric =TextStyle(fontWeight: FontWeight.w900,fontSize: 50);

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar( 
            pinned: true,
            backgroundColor: Colors.teal[800],
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
                title: Text('John Doe '),
                background: Image.network(
                  "https://cdn.vox-cdn.com/thumbor/wI3iu8sNbFJSQB4yMLsoPMNzIHU=/0x0:3368x3368/1200x800/filters:focal(1188x715:1726x1253)/cdn.vox-cdn.com/uploads/chorus_image/image/62994726/AJ_Finn_author_photo_color_photo_courtesy_of_the_author.0.jpg",
                  fit: BoxFit.cover,
                )
                ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_circle),
                tooltip: 'Add new entry',
                onPressed: () {/* ... */},
              ),
            ]),
      ];
    },
    body: ListView(
      children: <Widget>[SizedBox(height: 12,),
        Text('The London Times',style: title),
        SizedBox(height: 12,),
        new StatsCard(colour: Colors.blue[400],title: 25,subTitle: "Bags Collected 🤝"),
        StatsCard(colour: Colors.blue[600], title: 200, subTitle: " Dollars made 💰",),
        StatsCard(colour: Colors.blue[800],title: 20, subTitle: "Happy Customers 🎯",),
        
      ],
    )
    );
  }
}

class StatsCard extends StatelessWidget {
  const StatsCard({
    Key key,this.title,this.subTitle,this.colour
  }) : super(key: key);
  final   title;
  final String subTitle;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(            
        borderRadius: BorderRadius.circular(25),
        clipBehavior: Clip.hardEdge,
         elevation: 12,
         color: colour,
         child: Container(
         padding: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
         child: Column(
           children: <Widget>[
             Text(title.toString(),style: bigNumeric,),
             Text(subTitle,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),)
           ],
         ),
         )
      ),
    );
  }
}