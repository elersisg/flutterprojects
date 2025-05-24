// ExerciseModel.dart
class Exercise {
  final String nombre;
  final String imagen;
  final String deporte;

  Exercise({
    required this.nombre,
    required this.imagen,
    required this.deporte,
  });
}

List<Exercise> exercises = [
  Exercise(
    nombre: "Pesas",
    imagen: "pesas.jpg",
    deporte: "Trabajo con pesas....",
  ),
  Exercise(
    nombre: "Cinta Elastica",
    imagen: "cinta.jpg",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
  Exercise(
    nombre: "Cinta",
    imagen: "cinta2.jpg",
    deporte: "Trabajo con cinta 2 repeticiones de 15",
  ),
  Exercise(
    nombre: "Abdomen",
    imagen: "abdomen2.jpg",
    deporte: "Abdomen alto...",
  ),
  Exercise(
    nombre: "Peso",
    imagen: "pesas.jpg",
    deporte: "Trabajo pesas de 5kg",
  ),
  Exercise(
    nombre: "Gluteos",
    imagen: "gluteos.jpg",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
  Exercise(
    nombre: "Mas Gluteos",
    imagen: "gluteos2.jpg",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
  Exercise(
    nombre: "Barra",
    imagen: "barra2.jpg",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
  Exercise(
    nombre: "Rusa",
    imagen: "otro.png",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
  Exercise(
    nombre: "Cinta Elastica",
    imagen: "cinta2.jpg",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
  Exercise(
    nombre: "Peso z",
    imagen: "pesas.jpg",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
  Exercise(
    nombre: "Mancuernas",
    imagen: "mancuernas.jpg",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
  Exercise(
    nombre: "Estiramiento",
    imagen: "estiramiento.jpg",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
  Exercise(
    nombre: "Otro",
    imagen: "otro.png",
    deporte: "Fortalece pierna y Gluteos",
  ),
  Exercise(
    nombre: "Otro+",
    imagen: "otro1.png",
    deporte: "pierna y Gluteos",
  ),
  Exercise(
    nombre: "barra de 5k",
    imagen: "barra.jpg",
    deporte: "Trabajo con cinta 4 repeticiones de 15",
  ),
];