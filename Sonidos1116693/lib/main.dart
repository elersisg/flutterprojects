import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  // Ejecuta la aplicación
  runApp(const SoundApp());
}

class SoundApp extends StatelessWidget {
  const SoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Elimina el banner de depuración
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('')),
        body: const SoundButtons(),
      ),
    );
  }
}

class SoundButtons extends StatelessWidget {
  const SoundButtons({super.key});

  // Función que reproduce el sonido correspondiente
  Future<void> playSound(String fileName) async {
    final player = AudioPlayer();
    try {
      await player.setSource(AssetSource(fileName));
      await player.resume();
    } catch (e) {
      print("Error al reproducir el sonido: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Título principal en negrita y tamaño grande
        const Text(
          'Teclado para niños',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20), // Espacio entre el título y los botones

        // Todos los botones en una sola columna ocupando todo el ancho de la pantalla
        createButton('note1.wav', Colors.red, Icons.audiotrack),
        createButton('note2.wav', Colors.orange, Icons.audiotrack),
        createButton('note3.wav', Colors.yellow, Icons.audiotrack),
        createButton('note4.wav', Colors.green, Icons.audiotrack),
        createButton('note5.wav', Colors.blue, Icons.audiotrack),
        createButton('note6.wav', Colors.indigo, Icons.audiotrack),
        createButton('note7.wav', Colors.purple, Icons.audiotrack),
      ],
    );
  }

  // Función que crea un botón con un sonido, un color y un ícono
  Widget createButton(String soundFile, Color color, IconData icon) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0), // Espaciado vertical entre botones
        child: SizedBox(
          width: double.infinity, // Ocupa todo el ancho disponible
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color, // Establece el color de fondo del botón
              padding: const EdgeInsets.symmetric(vertical: 20.0), // Tamaño del botón
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Bordes sin redondear para ocupar toda la pantalla
              ),
            ),
            onPressed: () => playSound(soundFile), // Reproduce el sonido cuando se presiona el botón
            child: Icon(
              icon, // Ícono del botón
              size: 50.0, // Tamaño del ícono
              color: Colors.white, // Color del ícono
            ),
          ),
        ),
      ),
    );
  }
}
