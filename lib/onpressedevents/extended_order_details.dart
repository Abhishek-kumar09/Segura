import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Functions.dart';
import 'package:segura_manegerial/Custom Function And Widgets/Widgets.dart';
import 'package:segura_manegerial/onpressedevents/crud.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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
bool done = false;

const TextStyle fielStyle = TextStyle(
    fontSize: 20,
    color: Colors.indigo,
    wordSpacing: 6,
    fontWeight: FontWeight.bold);

class _ExtendedOrderDetailState extends State<ExtendedOrderDetail> {
  bool isOtpDialog = false;
  int otp2 =0;
  // Future<String> getData() async {
  //   http.Response response = await http.get(
  //     Uri.encodeFull('https://api.darksky.net/forecast/3651b65c6819a4b460142904270583e0/37.8267,-122.4233?lang=hi&exclude=currently,minutely'),
  //   );
  //   print(response.body);
  //   // return response.body.toString();
  // }


  @override
  void initState() {
    done = (widget.isDone) ? true : false;
    super.initState();
  }
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
          // (widget.isPremium)
          //     ? Positioned(
          //         top: 180,
          //         child: RowWithIcon(
          //           iconSize: iconSize,
          //           icon: Icons.star,
          //           text: "Its A Premium Order",
          //           colour: golden,
          //           textColor: Colors.white,
          //         ))
          //     : Container(),
          // (isOtpDialog) ? Row(
          //   children: <Widget>[
          //   TextFormField(
          //   autofocus: true, 
          //   autovalidate: true,

          //   onChanged: (value) async {
          //     // await CRUD.updateCapacity(12);
          //       otp2 = int.parse(value);                
          //   },
          //   decoration: buildLoginInputDecoration("Enter OTP", Icons.vpn_key)),
          //   RoundedButton(colour: Colors.blueAccent,text: "Verify",
          //   onpressed: () async {              
          //       if(await CRUD.checkOTP(widget.phone, otp2)) {
          //              CRUD.updateOrder(widget.phone);
          //                 setState(() {
          //                   done = false;
          //                 });
          //       } else {
          //         Fluttertoast.showToast(msg: "Wrong OTP");
          //       }
          //   },)
          // ],): Container(),
          Container(              
              margin: EdgeInsets.only(top: 220),
              width: double.infinity,
              height: double.infinity,
              decoration: boxDecoration(),
              child: ListView(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    CustomerDetails("Name",widget.name),
                    // (widget.noofBags == 1) ? Text('${widget.noofBags} Bags') : Text('${widget.noofBags} Bag 👜️ '),
                    Divider(),CustomerDetails("No. of Bags Placed",widget.noofBags.toString() + "bag"),Divider(),
                    CustomerDetails("Order Status",(widget.acceptStatus) ? "Accepted" : "Please Accept the Order"),Divider(),
                    CustomerDetails("Completion Status",(done) ? "Completed": "Not Completed"),
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
                      padding: EdgeInsets.only(top: 60,left: 0,right: 40),
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(15)),
                        onPressed: () {     
                          isOtpDialog = true; 
                          CRUD.updateOrder(widget.phone);
                          setState(() {
                            done = true;
                          });                  

                        },
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.done,
                                color: Colors.white,
                                semanticLabel: "Call the Customer",
                                size: iconSize),
                                Text((done)? "    You Successfully Greeted a Customer" : "   Return bag to ${widget.name}" ,style: TextStyle(color: Colors.white70,))
                          ],
                        ),
                      ),                    
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10,left: 40,right: 0),
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
        Text(category,style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20,)),      
        Text(detail,style: TextStyle(
    color: Colors.blue[900], fontWeight: FontWeight.w600, fontSize: 20)),
      ],),
    );
  }
}



// class TextLocal extends StatefulWidget {
//   @override
//   _TextLocalState createState() => _TextLocalState();
// }

// class _TextLocalState extends State<TextLocal> {

//   void getData() async {
//     http.Response response = await http.get(
//       Uri.encodeFull(""),
//     );
//     print(response.body);
//     Map<String,dynamic> map = jsonDecode(response.body);
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: RaisedButton(
//           child: Text("data"),
//           onPressed: ()async {
//             await getData();
//           },
//         ),
//       ),
//     );
//   }
// }







class OtpWala {
  static int generateOtp() => 1000 + Random().nextInt(9999-1000);
  static int otp1 = generateOtp();
  static int otp2 = generateOtp();

  String s = "https://api.textlocal.in/send/?apiKey=YIu9croexWE-quVs6QDj6EZzbNVKCZRNe9JnZhcP2k&sender=TXTLCL&numbers=919354472907&message=Welcome to Segura!" + 
  "Your OTP for luggage verification is "+ otp1.toString()+
  "OTP for bag received is" +otp2.toString()+".<PROVIDE THIS OTP AT TIME OF RECEIVING BAG>"+
  "Thanks for using Segura!&test=true";

    void getData() async {
    http.Response response = await http.get(
      Uri.encodeFull(s),
    );
    print(response.body);
    print(s);
  }

  }