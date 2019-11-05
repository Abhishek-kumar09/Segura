import 'package:flutter/material.dart';

class ManagerPage extends StatefulWidget {
  static String id = 'Manager';
  @override
  _ManagerPageState createState() => _ManagerPageState();
}


class _ManagerPageState extends State<ManagerPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                pinned: true,
                backgroundColor: Colors.teal[800],
                expandedHeight: 300.0,
                flexibleSpace: FlexibleSpaceBar(
                    title: Text('Segura '),
                    background: Image.network(
                      "https://i.pinimg.com/736x/18/cb/d1/18cbd18f31929e0590478fc882343ac6.jpg",
                      fit: BoxFit.cover,
                    )),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    tooltip: 'Add new entry',
                    onPressed: () {/* ... */},
                  ),
                ]),
          ];
        },
        body: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            new Aaa(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            new GridContainer(),
            
          ],
        ),
      ),
    );
  }
}

class GridContainer extends StatelessWidget {
  const GridContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(10),
      child: RawMaterialButton(onPressed: () { }, child: Text('gridContainer')),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black12,
          width: 5,
        ),
      ),
    );
  }
}

class Aaa extends StatefulWidget {
  @override
  _AaaState createState() => _AaaState();
}

int height = 100;

class _AaaState extends State<Aaa> {
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.all(10),
      child: Text('I am Aaa'),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black12,
          width: 5,
        ),
      ),
    );
  }
}
