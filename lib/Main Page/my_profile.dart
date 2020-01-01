import 'package:flutter/material.dart';
import 'package:segura_manegerial/Login%20And%20Register/registration_screen.dart';


TextStyle title = TextStyle(fontWeight: FontWeight.w800, fontSize: 25,color: Colors.white70);
TextStyle bigNumeric = TextStyle(fontWeight: FontWeight.w900, fontSize: 50);

class MyProfile extends StatefulWidget {
  const MyProfile({@required this.name,@required this.business,this.email ,this.bagCollected,this.earnings,this.photo,this.city,this.phone,@required this.shop});
  final String name;
  final String business;
  final String photo;
  final String city;
  final int bagCollected;
  final int earnings;
  final String phone;
  final String email;
  final String shop;

  @override
  _MyProfileState createState() => _MyProfileState();
}


class _MyProfileState extends State<MyProfile> {
  // @override
  // void initState() {
  //   RegistrationDataBase.getUserInfo();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[           
            SliverAppBar(
                //pinned: true,
                backgroundColor: Colors.teal[800],
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text(widget.name),
                    background: Image.network(
                      "https://cdn.vox-cdn.com/thumbor/wI3iu8sNbFJSQB4yMLsoPMNzIHU=/0x0:3368x3368/1200x800/filters:focal(1188x715:1726x1253)/cdn.vox-cdn.com/uploads/chorus_image/image/62994726/AJ_Finn_author_photo_color_photo_courtesy_of_the_author.0.jpg",                      
                      fit: BoxFit.cover,
                    )),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    tooltip: 'Add new entry',
                    onPressed: () async {
                      // GoogleSignInAccount g =await Globalk.getGoogleUser();
                      // print(g.email);
                      //print(Globalk.firebaseUser);
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
            Text(widget.business, style: title),
            MyStats(business: widget.business,
            city: widget.city,
            phone: widget.phone,
            email: widget.email,
            name: widget.name,
            shop: widget.shop,),
            SizedBox(
              height: 12,
            ),
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
  const MyStats({this.business,this.city,this.email,this.phone,@required this.name,this.shop})
  :assert(business != null),
  assert(city != null),
  assert(email != null),
  assert(phone != null);
  final String business;
  final String city;
  final String name;
  final String phone;
  final String email;
  final String shop;
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
                child: Image.network(
                      "https://cdn.vox-cdn.com/thumbor/wI3iu8sNbFJSQB4yMLsoPMNzIHU=/0x0:3368x3368/1200x800/filters:focal(1188x715:1726x1253)/cdn.vox-cdn.com/uploads/chorus_image/image/62994726/AJ_Finn_author_photo_color_photo_courtesy_of_the_author.0.jpg",
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
                  Text(email,style: Theme.of(context).textTheme.subhead),
                  Text(phone,style: Theme.of(context).textTheme.subhead,),
                  Text('Rating: 🌟️🌟️🌟️🌟️🌟️') ,SizedBox(height: 15)         ,                      
                ],
              ),
            ),
           // SizedBox(height: 600,)
           Positioned(
             top: 380,
             left: 280,
             
             child: FloatingActionButton(
               onPressed: (){ 
                 Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(business: business,city: city,name: name,shop: shop,)));
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
