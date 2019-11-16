import 'package:flutter/material.dart';

class AnimatePractice extends StatefulWidget {
  @override
  _AnimatePracticeState createState() => _AnimatePracticeState();
}

class _AnimatePracticeState extends State<AnimatePractice> {
  int height = 100;
  int width = 150;
  String text = "";
  String subText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text("Click Me"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Onclick()));
            },
          ),
          Hero(
            tag: 'hero',
            child: AnimatedContainer(
              duration: Duration(seconds: 0),
              height: height.toDouble(),
              width: width.toDouble(),
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}

class Onclick extends StatefulWidget {
  @override
  _OnclickState createState() => _OnclickState();
}

class _OnclickState extends State<Onclick> {
  int height = 900;
  int width = 00;

  void heyState() async {
    await Future.delayed(Duration(milliseconds: animationDuration), () => "height += 100");
    setState(() {
      height = 900;
      width = 400;
    });
    await Future.delayed(Duration(milliseconds: animationDuration), () => "height += 100");
    setState(() {
      height = 150;
      width = 400;
    });
  }

  @override
  void initState() {
    heyState();
    super.initState();
  }
  int animationDuration = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'hedro',
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                
                duration: Duration(milliseconds: animationDuration),
                height: height.toDouble(),
                width: width.toDouble(),
                color: Colors.blue[900],
                child: Text("Welcome to Segura!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
              ),
              
              Padding(
                padding: EdgeInsets.only(top: height.toDouble() - 60),
                child: Text("Whoa! What A",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w900)),
              ),
              //AnimatedContainer(duration: Duration(milliseconds: 700),margin: EdgeInsets.only(top: 50,right: width.toDouble()/40), height: 5,width: width.toDouble(),color: Colors.redAccent,),
              Padding(
                padding: EdgeInsets.only(top: height.toDouble() - 00),
                child: Text("beautiful Day!",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 50,
                        fontWeight: FontWeight.w900)),
              ),
              Padding(
                padding: EdgeInsets.only(top: height.toDouble() + 90),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: <Widget>[
                    new GridConatainer(),new GridConatainer(),new GridConatainer(),new GridConatainer(),new GridConatainer(),new GridConatainer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridConatainer extends StatelessWidget {
  const GridConatainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.blue[900],
          width: 5,
        ),
      ),
    );
  }
}
