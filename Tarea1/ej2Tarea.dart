/* 2.	Pídale al usuario un número. 
Dependiendo de si el número es par o impar, 
imprima un mensaje apropiado para el usuario.
*/
import 'dart:io';

void main() {
  print('Ingrese un numero');
  int numero = int.parse(stdin.readLineSync()!);
  if (numero % 2 == 0) {
    print('El $numero es par');
  } else {
    print('El $numero es impar');
  }
}
