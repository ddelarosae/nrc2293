import 'dart:convert';

void main() {
  String archivoJson = '{"name":"Mario Bucheli","age":28}';
  Map<String, dynamic> map = jsonDecode(archivoJson);
  int edad = map['age'];
  String nombre = map['name'];
  Person persona = Person(nombre, edad);
  print(persona.edad);
  print(persona.nombre);
}

class Person {
  Person(this.nombre, this.edad);
  final String nombre;
  final int edad;
}
