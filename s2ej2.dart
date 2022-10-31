import 'dart:io';

void main() {
  print('ingrese num1');
  int num1 = int.parse(stdin.readLineSync()!);
  print('ingrese num2');
  int num2 = int.parse(stdin.readLineSync()!);
  print('digite la operacion a realizar');
  String op = stdin.readLineSync()!;
  if (op.toLowerCase() == 'sumar') {
    sumar(num1, num2);
  } else if (op.toLowerCase() == 'restar') {
    restar(num1, num2);
  }
}

sumar(num1, num2) {
  int resultado = num1 + num2;
  print(resultado);
}

restar(num1, num2) {
  int resultado = num1 - num2;
  print(resultado);
}
