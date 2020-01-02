import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({this.colour, this.hero, this.onpressed, this.text});
  final Color colour;
  final String hero;
  final Function onpressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child:(hero !=null) ? Hero(
          tag: hero,
          child: MaterialButton(
            onPressed: onpressed,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ) : MaterialButton(
            onPressed: onpressed,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ) ,
      ),
    );
  }
}

class RowWithIcon extends StatelessWidget {
  const RowWithIcon({
    Key key,
    @required this.iconSize,
    @required this.icon,
    @required this.text,
    @required this.colour,
    this.textColor,
  }) : super(key: key);

  final double iconSize;
  final IconData icon;
  final String text;
  final Color colour,textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: colour,
            size: iconSize,
          ),
          Text(text,style: TextStyle(color: textColor),)]);
  }
}