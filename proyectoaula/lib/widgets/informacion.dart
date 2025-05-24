import 'package:flutter/material.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key, required this.deporte});

  final String deporte;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
            padding: const EdgeInsets.all(10.0),
          child: new Text(
              deporte,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
