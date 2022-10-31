/*
3.Pídale al usuario su edad e imprima
si puede o no votar en las elecciones
*/
import 'dart:io';

void main() {
  print('Ingrese su edad');
  int edad = int.parse(stdin.readLineSync().toString());
  if (edad >= 18) {
    print("usted puede votar");
  } else {
    print("usted no puede votar");
  }
}
