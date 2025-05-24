import 'package:flutter/material.dart';

class IconTec extends StatelessWidget {
  IconTec({required this.icon,required this.tec});
  final IconData icon;
  final String tec;

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            tec,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}