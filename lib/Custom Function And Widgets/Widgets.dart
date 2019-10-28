import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({this.colour, this.logo, this.onpressed});
  final Color colour;
  final String logo;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: Hero(
          tag: logo,
          child: MaterialButton(
            onPressed: onpressed,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              'Log In',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
