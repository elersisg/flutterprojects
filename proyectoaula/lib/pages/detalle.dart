import 'package:flutter/material.dart';
import 'package:proyectoaula/widgets/rate.dart';
import 'package:proyectoaula/widgets/contact.dart';
import 'package:proyectoaula/widgets/informacion.dart';

class Detalle extends StatelessWidget {
  final String nombre;
  final String imagen;
  final String deporte;

  Detalle({
    required this.nombre,
    required this.imagen,
    required this.deporte,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(nombre),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 387.0, // tamaño de la imagen
            child: Hero(
              tag: nombre,
              child: Material(
                child: InkWell(
                  child: Image.asset(
                    "assets/img/$imagen",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Rate(nombre: nombre),
          IniciarIcon(),
          Informacion(deporte: deporte),
        ],
      ),
    );
  }
}
