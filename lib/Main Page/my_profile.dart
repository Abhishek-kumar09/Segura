import 'package:flutter/material.dart';
import 'package:segura_manegerial/Login%20And%20Register/registration_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:segura_manegerial/onpressedevents/crud.dart';
import 'package:segura_manegerial/onpressedevents/modal_bottom_sheet.dart';


TextStyle title = TextStyle(fontWeight: FontWeight.w800, fontSize: 25,color: Colors.white70);
TextStyle bigNumeric = TextStyle(fontWeight: FontWeight.w900, fontSize: 50);

class MyProfile extends StatefulWidget {
  const MyProfile({@required this.name,@required this.business,this.email ,this.bagCollected,this.earnings,@required this.photo,this.city,this.phone,@required this.shop,this.capacity});
  final String name;
  final String business;
  final String photo;
  final String city;
  final int bagCollected;
  final int earnings;
  final String phone;
  final String email;
  final String shop;
  final int capacity;
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
                backgroundColor: Colors.teal[800],
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text("${widget.name}"),
                    background: !(widget.photo == null || widget.photo == '') ? CachedNetworkImage(
                                imageUrl: widget.photo,
                                fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(                                 
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.white10, BlendMode.color)),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    Center(
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        child: CircularProgressIndicator()),
                                    ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ): Container(color: Colors.blue[900],child: Icon(Icons.person,color:Colors.white60,size: 200))
                              // Image.asset('assets/defaultUser.png',fit: BoxFit.cover,colorBlendMode: BlendMode.colorBurn,)
                              ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.edit),
                    tooltip: 'Add new entry',
                    onPressed: () async {                    
                      await CRUD.uploadImage();
                      setState(() {});
                    },
                  ),
                ]),
          ];
        },
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            Text(widget.shop, style: title),
            MyStats(business: widget.shop,
            city: widget.city,
            phone: widget.phone,
            email: widget.email,
            name: widget.name,
            shop: widget.shop,
            photo: widget.photo,),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,                  
                  children: <Widget>[
                    Center(child: Text("Current Capacity",style: Theme.of(context).textTheme.display2)),
                    Text('${widget.capacity}',style: Theme.of(context).primaryTextTheme.display2),  
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: OutlineButton(
                        child: Container(child: Center(child: Text('Extend Capacity',style: Theme.of(context).primaryTextTheme.headline)),                      
                        width: double.infinity,
                        ),
                        onPressed: (){
                          showModalBottomSheet(
                          context: context,
                          builder: (context) => ExtendCapacity(widget.capacity.toDouble()),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
                          ),
                          elevation: 10,
                        );},
                      ),
                    ),                                     
                  ],
                ),
                height: 200,decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(35),                  
              ),),
            ),
            SizedBox(height: 12),
            StatsCard(
                colour: Colors.blue[400],
                title: widget.bagCollected,
                subTitle: "Bags Collected 🤝"),
            StatsCard(
              colour: Colors.blue[600],
              title: widget.earnings,
              subTitle: " Dollars made 💰",
            ),
            StatsCard(
              colour: Colors.blue[800],
              title: 20,
              subTitle: "Happy Customers 🎯",
            ),
          ],
        ));
  }
}

class StatsCard extends StatelessWidget {
  const StatsCard({Key key, this.title, this.subTitle, this.colour})
      : super(key: key);
  final title;
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
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              children: <Widget>[
                Text(
                  title.toString(),
                  style: bigNumeric,
                ),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                )
              ],
            ),
          )),
    );
  }
}

class MyStats extends StatelessWidget {
  const MyStats({this.business,this.city,this.email,this.phone,@required this.name,this.shop,this.photo})
  :assert(business != null),
  assert(city != null),
  assert(phone != null);
  final String business;
  final String city;
  final String name;
  final String phone;
  final String email;
  final String shop;
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 10,
        // color: Color(0xFF1b5aa8),
        //color: Colors.amber[700],
        //color: Color(0xFF54062c),
        color: Color(0xFFcc7f02),
        child: Stack(
         // fit: StackFit.expand,
          children: <Widget>[
            ClipPath(
              clipper: BottomLineClipper(),
              child: Container(                
                //color: Colors.deepPurpleAccent,
                height: 220,
                width: double.infinity,
                child: Image.network(
                      "https://qph.fs.quoracdn.net/main-qimg-88acf2e17201a239a333cbc78bef1be5",
                      fit: BoxFit.cover,
                  ),
              ),              
            ),
            Container(
              margin: EdgeInsets.only(top: 220), 
              padding: EdgeInsets.all(8),              
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("The $business",style: Theme.of(context).textTheme.display1),
                  SizedBox(height: 10,),
                  Text("in $city",style: title),
                  SizedBox(height: 10,),
                  Text("Indulged in $business",style: Theme.of(context).textTheme.subhead),
                  Text(phone,style: Theme.of(context).textTheme.subhead,),
                  Text('Rating: 🌟️🌟️🌟️🌟️🌟️') ,SizedBox(height: 15),                      
                ],
              ),
            ),
           // SizedBox(height: 600,)
           Positioned(
             top: 100,
             left: 280,             
             child: FloatingActionButton(
               onPressed: (){ 
                 Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(business: business,city: city,name: name,shop: shop,photo: photo,)));
               },
               backgroundColor: Colors.white70,
               mini: true,
               child: Icon(Icons.edit),foregroundColor: Colors.teal[800],),
               ),
          ],
        ),
      ),
    );
  }
}


class BottomLineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0,0);
    path.lineTo(0, size.height-20);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



// class BottomWaveClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = new Path();
//     path.lineTo(0.0, size.height - 20);

//     var firstControlPoint = Offset(size.width / 4, size.height);
//     var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     var secondControlPoint =
//         Offset(size.width - (size.width / 3.25), size.height - 65);
//     var secondEndPoint = Offset(size.width, size.height - 40);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);

//     path.lineTo(size.width, size.height - 40);
//     path.lineTo(size.width, 0.0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
