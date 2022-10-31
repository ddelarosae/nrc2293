import 'dart:io';

void main() {
  print('ingrese num1');
  int num1 = int.parse(stdin.readLineSync()!);
  print('ingrese num2');
  int num2 = int.parse(stdin.readLineSync()!);
  print(sumar(num1, num2));
  print(restar(b: num2, a: num1));
}

dynamic sumar(a, b) => a + b;
dynamic restar({a, b}) => (a ?? 0) - b;
