import 'package:flutter/material.dart';

class ExtendedOrderDetail extends StatefulWidget {
  ExtendedOrderDetail({this.name,this.phone,this.noofBags});
  final String name ;
  final String phone;
  final noofBags;
  @override
  _ExtendedOrderDetailState createState() => _ExtendedOrderDetailState();
}

const TextStyle fielStyle = TextStyle(fontSize: 20,color: Colors.indigo , wordSpacing: 6,fontWeight: FontWeight.bold);

class _ExtendedOrderDetailState extends State<ExtendedOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(           
            color: Colors.blue[900],
            child: SizedBox(height: 50,
            child: Row(children: <Widget>[
              Expanded(flex: 5,
                child: RaisedButton(onPressed: (){},
                  child: Text('The order is accepted',style: TextStyle(color: Colors.white),),color: Colors.green,)),
              SizedBox(width: 5,),
              Expanded(child: RaisedButton(
                
                onPressed: (){//TODO:
                },
                color: Colors.red,disabledColor: Colors.red,
              child: Icon(Icons.cancel,color: Colors.white,))),
            ],),
            ),
          ),
      backgroundColor: Colors.blue[200],
      body: ListView(
        
        children: <Widget>[          
          Container(
           // padding: EdgeInsets.symmetric(horizontal: 10),
            height: 200,            
            width: double.infinity,
            child: Image.network(
                      "https://cdn.vox-cdn.com/thumbor/wI3iu8sNbFJSQB4yMLsoPMNzIHU=/0x0:3368x3368/1200x800/filters:focal(1188x715:1726x1253)/cdn.vox-cdn.com/uploads/chorus_image/image/62994726/AJ_Finn_author_photo_color_photo_courtesy_of_the_author.0.jpg",
                      fit: BoxFit.cover,
                  ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40,),
                Text(widget.name,style: fielStyle,),
                SizedBox(height: 5,),
                Text(widget.phone,style: fielStyle),
                SizedBox(height: 5,),
                Text(widget.noofBags,style: fielStyle),SizedBox(height: 5,),
                Text("AnotherField",style: fielStyle),SizedBox(height: 5,),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
