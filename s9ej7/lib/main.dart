import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Prueba Conectividad',
      theme: ThemeData(primarySwatch: Colors.lime),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String connectionStatus = '------';
  late StreamSubscription subscription;
  @override
  void initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print("estado de la nueva conexion: $result");
    });
  }

  // Be sure to cancel subscription after you are done
  @override
  void dispose() {
    super.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Sesion9 Conectividad'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: checkStatus,
              child: const Text('Verificar estado de la red'),
            ),
            const SizedBox(height: 20),
            Text(
              connectionStatus,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void checkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('Usted esta conectado en una red con datos');
      setState(() {
        connectionStatus = 'Usted esta conectado en una red con datos';
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      print('Usted esta conectado en una red con wifi');
      setState(() {
        connectionStatus = 'Usted esta conectado en una red con wifi';
      });
    } else {
      print('Usted no esta conectado a ninguna red');
      setState(() {
        connectionStatus = 'Usted no esta conectado a ninguna red';
      });
    }
  }
}
