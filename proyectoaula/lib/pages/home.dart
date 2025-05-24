import 'package:flutter/material.dart';
import 'package:proyectoaula/pages/calculadora_imc.dart';
import 'package:proyectoaula/pages/nosotros.dart';
import 'package:proyectoaula/pages/detalle.dart';
import 'package:proyectoaula/data/ejercicios_data.dart';
import 'package:proyectoaula/models/ejercicio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: const Text('Ejercicios'),
                accountEmail: const Text('fitness@gmail.com'),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/estiramiento.jpg'),
                  ),
                ),
              ),
              ListTile(
                title: const Text("Calculadora IMC"),
                leading: const Icon(Icons.calculate),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BMICalculatorScreen()),
                  );
                },
              ),
              ListTile(
                title: const Text("Soporte"),
                leading: const Icon(Icons.support_agent),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Nosotros()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: ejerciciosData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: ejerciciosData.length,
        itemBuilder: (context, index) {
          final Exercise ejercicio = ejerciciosData[index];

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Detalle(
                    nombre: ejercicio.nombre,
                    imagen: ejercicio.imagen,
                    deporte: ejercicio.deporte,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/img/${ejercicio.imagen}',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ejercicio.nombre,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          ejercicio.deporte,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
