import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:intl/intl.dart';
import 'package:s10firebase_android/model/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerAge;
  late TextEditingController controllerBirthday;

  @override
  void initState() {
    super.initState();

    controllerName = TextEditingController();
    controllerAge = TextEditingController();
    controllerBirthday = TextEditingController();
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerAge.dispose();
    controllerBirthday.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Agregar usuario'),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              TextFormField(
                controller: controllerName,
                decoration: decoration('Nombre'),
                validator: (text) =>
                    text != null && text.isEmpty ? 'Entrada no valida' : null,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: controllerAge,
                decoration: decoration('Edad'),
                keyboardType: TextInputType.number,
                validator: (text) => text != null && int.tryParse(text) == null
                    ? 'Entrada no valida'
                    : null,
              ),
              const SizedBox(
                height: 24,
              ),
              DateTimeField(
                controller: controllerBirthday,
                decoration: decoration('Fecha de nacimiento'),
                validator: (dateTime) =>
                    dateTime == null ? 'Entrada no valida' : null,
                format: DateFormat("yyyy-MM-dd"),
                onShowPicker: (context, currentValue) => showDatePicker(
                    context: context,
                    initialDate: currentValue ?? DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100)),
              ),
              const SizedBox(
                height: 36,
              ),
              ElevatedButton(
                child: const Text('Agregar'),
                onPressed: () {
                  final isValid = formKey.currentState!.validate();

                  if (isValid) {
                    final user = User(
                      name: controllerName.text,
                      age: int.parse(controllerAge.text),
                      birthday: DateTime.parse(controllerBirthday.text),
                    );
                    createUser(user);

                    final snackBar = SnackBar(
                      backgroundColor: Colors.indigo,
                      content: Text(
                        '${controllerName.text} se ha agregado a Firebase',
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      );
  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      );
  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}
