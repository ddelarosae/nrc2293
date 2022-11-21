import 'dart:convert';

class Person {
  Person(this.name, this.age);
  final String name;
  final int age;
  Person.fromJson(Map<String, dynamic> map)
      : name = map['name'],
        age = map['age'];
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}

void main() {
  String archivoJson = '{"name": "Esteban", "age":24}';
  Map<String, dynamic> map = jsonDecode(archivoJson);
  Person persona = Person.fromJson(map);
  print('El usuario ${persona.name} tiene ${persona.age} años');
}
