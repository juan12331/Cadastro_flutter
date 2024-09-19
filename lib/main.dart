import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/cadastro.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
         '/home': (context) => const Home()
      },
    );
  }
}
