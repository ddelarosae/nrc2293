import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../provider/google_sign_in.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const FlutterLogo(size: 120),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Hola, \n bienvenido'),
            ),
            const Spacer(),
            ElevatedButton.icon(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                label: const Text('Conectarse con Google')),
            const SizedBox(height: 40),
            RichText(
              text: const TextSpan(
                text: 'Tienes alguna cuenta?',
                children: [
                  TextSpan(
                    text: 'Conectarse',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      );
}
