import 'dart:io';

void main() {
  stdout.writeln('Digite su nombre');
  var name = stdin.readLineSync();
  print('Su nombre es $name');
}
