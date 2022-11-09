import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Teclado NRC2293',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Teclado(),
    );
  }
}

class Teclado extends StatelessWidget {
  const Teclado({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', scale: 10),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Actividad de aprendizaje',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          backgroundColor: Colors.purple[500],
        ),
        body: Column(
          children: [
            const TextField(
              decoration:
                  InputDecoration(labelText: 'Ingrese un correo electronico'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              decoration:
                  const InputDecoration(labelText: 'Ingrese un numero decimal'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]'))
              ],
            ),
            const TextField(
              decoration:
                  InputDecoration(labelText: 'Ingrese un numero telefonico'),
              keyboardType: TextInputType.phone,
            )
          ],
        ),
      ),
    );
  }
}
