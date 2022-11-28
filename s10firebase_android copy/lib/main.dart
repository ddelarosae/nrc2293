import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:s10firebase_android/page/user_page.dart';
import 'package:s10firebase_android/model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "FireStore Read and Write NRC2293";
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(46),
              textStyle: const TextStyle(fontSize: 24),
            ),
          ),
        ),
        home: const MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Lista de usuarios'),
        ),
        body: buildUsers(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserPage(),
            ));
          },
        ),
      );

  Widget buildUsers() => StreamBuilder<List<User>>(
      stream: readUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Ha ocurrido este error ${snapshot.error}');
        } else if (snapshot.hasData) {
          final users = snapshot.data!;
          return ListView(
            children: users.map(buildUser).toList(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.age}')),
        title: Text(user.name),
        subtitle: Text(user.birthday.toIso8601String()),
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future<User?> readUser() async {
    final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');
    final snapshot = await docUser.get();
    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }
  }

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final json = {
      'id': docUser.id,
      'name': name,
      'age': 21,
      'birthday': DateTime(2022, 11, 25),
    };
    await docUser.set(json);
  }
}
