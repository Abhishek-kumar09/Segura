import 'package:flutter/material.dart';

String changedName, password;

class UpdateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: CircleAvatar(
                minRadius: 30,
                maxRadius: 60,
                backgroundImage: NetworkImage(
                    'https://cdn.vox-cdn.com/thumbor/wI3iu8sNbFJSQB4yMLsoPMNzIHU=/0x0:3368x3368/1200x800/filters:focal(1188x715:1726x1253)/cdn.vox-cdn.com/uploads/chorus_image/image/62994726/AJ_Finn_author_photo_color_photo_courtesy_of_the_author.0.jpg')),
          ),
          Flexible(child: SizedBox(height: 25)),
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(helperText: "Name"),
            autofocus: false,
            maxLines: 1,
            initialValue: 'Abhishek',
            //controller: TextEditingController(text : "hello"),
            onChanged: (name) {
              changedName = (name == null) ? 'Abhishek' : name;
            },
          ),
          TextFormField(
            autofocus: false,
            maxLines: 1,
            initialValue: 'kumar',
            //controller: TextEditingController(text : "boys"),
            onChanged: (pass) {
              password = (pass == null) ? 'kumar' : pass;
            },
          ),
          SizedBox(height: 15,),
          RaisedButton(            
            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 20),
            color: Colors.green,
            child: Text('Update Data'),
            onPressed: () {
              print(changedName);
              print(password);
            },
          )
        ],
      ),
    );
  }
}
