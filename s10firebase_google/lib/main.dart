import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '/../page/home_page.dart';
import '/../provider/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'MainPage';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: title,
          theme: ThemeData.dark(),
          home: const HomePage(),
        ),
      );
}
