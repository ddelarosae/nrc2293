/*
1.	Cree un programa que pida al usuario 
que introduzca su nombre y su edad. 
Imprima un mensaje que indique en cuántos 
años le faltara para cumplir 100 años
*/
import 'dart:io';

void main() {
  print('Ingrese su nombre');
  String nombre = stdin.readLineSync()!;
  stdout.writeln('Ingrese su edad');
  int edad = int.parse(stdin.readLineSync()!);
  edad = 100 - edad;
  print('A $nombre le faltan $edad años para cumplir 100 años');
}
