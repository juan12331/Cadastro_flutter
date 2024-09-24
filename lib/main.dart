import 'package:flutter/material.dart';
import 'package:terceiro/shared/style.dart';
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
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrime,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.cinza),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Login(),
        '/cadastro': (context) => const Cadastro(),
         '/home': (context) => const Home()
      },
    );
  }
}
