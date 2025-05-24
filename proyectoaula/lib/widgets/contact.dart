import 'package:flutter/material.dart';
import 'icon_tec.dart';

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconTec(
              icon: Icons.call,
              tec: "Llamar"
          ),
          new IconTec(
              icon: Icons.message,
              tec: "WhastApp"
          ),
          new IconTec(
              icon: Icons.photo,
              tec: "Foto"
          ),
        ],
      ),
    );
  }
}

