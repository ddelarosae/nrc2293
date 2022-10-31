/*
Genera un número aleatorio entre 1 y 100. 
Pídale al usuario que adivine el número, 
luego dígale si adivinó demasiado bajo, 
demasiado alto o exactamente correcto
*/
import 'dart:math';
import 'dart:io';

void main() {
  print('digita salir para terminar el juego');
  juego();
}

juego() {
  final int randomNumber = Random().nextInt(99) + 1;
  print('El numero ganador es $randomNumber');
  int intentos = 0;
  while (true) {
    intentos += 1;
    print('Ingrese un numero entre 1 y 100');
    String datoIngresado = stdin.readLineSync()!;
    if (datoIngresado.toLowerCase() == "salir") {
      break;
    } else if (int.parse(datoIngresado) > 100) {
      print('el numero no puede superar el valor de 100');
      continue;
    } else if (int.parse(datoIngresado) == randomNumber) {
      print('usted ha ganado');
      print('en $intentos intentos');
      continue;
    } else if (int.parse(datoIngresado) > randomNumber) {
      print('el numero es mayor al esperado');
      continue;
    } else {
      print('el numero es menor al esperado');
      continue;
    }
  }
  print('Ha terminado el juego');
}
