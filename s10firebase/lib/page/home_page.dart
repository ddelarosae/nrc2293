import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget/logged_in_widget.dart';
import '../widget/sign_up_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('Existe el siguiente error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const SignUpWidget();
            }
          },
        ),
      );
}
