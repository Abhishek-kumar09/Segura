import 'package:flutter/material.dart';

class Manager extends StatelessWidget {
static String id = 'Manager';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'THIS IS MANAGER PAGE',
        ),
      ),
      body: Text(
        'THIS IS MANAGER PAGE',
        style: TextStyle(
          fontSize: 100.0,
        ),
      ),
    );
  }
}
